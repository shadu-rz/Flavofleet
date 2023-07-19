import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fleet_main/Pages/Food/recomended_food_details.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/show_custom_snackbar.dart';
import 'package:flavour_fleet_main/controller/cart_controller.dart';
import 'package:flavour_fleet_main/firebase/firebase_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListWidget extends StatelessWidget {
  final FirebaseMethods firebase = Get.put(FirebaseMethods());
  final CartController countController = Get.put(CartController());
  CartListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('cart')
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return Center(
              child: BigText(text: 'No items found'),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: BigText(text: 'No items found'),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: BigText(text: 'Check your internet connection'),
            );
          }
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(
              height: Dimensions.height10,
            ),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var snap = snapshot.data!.docs[index].data();
              return GestureDetector(
                onTap: () {
                  navigator!.push(MaterialPageRoute(
                    builder: (context) => RecomendedFoodDetails(snap: snap),
                  ));
                },
                child: Container(
                  margin: EdgeInsets.only(top: Dimensions.height10),
                  // color: Colors.amber,
                  height: 100,
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Container(
                        width: Dimensions.height20 * 4,
                        height: Dimensions.height20 * 4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(snap['image']),
                            ),
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: Dimensions.height20 * 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(
                                text: snap['title'],
                                size: Dimensions.font20 - 2,
                                color: Colors.black54,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BigText(
                                    text: '₹ ${snap['price']}',
                                    size: Dimensions.font20 - 2,
                                    color: Colors.redAccent,
                                  ),
                                  //containerrr
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: Dimensions.height10,
                          bottom: Dimensions.height10,
                          right: Dimensions.width20 / 2,
                          left: Dimensions.width20 / 2,
                        ),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            color: Colors.white),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await _showMyDialog(context,snap);
                              },
                              child: const Icon(
                                Icons.delete_outline,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: Dimensions.width20),
                            CircleAvatar(
                              backgroundColor: AppColors.mainColor,
                              radius: 12,
                              child: GestureDetector(
                                onTap: () async {
                                  int count = CartController()
                                      .decrementInCart(snap['itemCount']);
                                  await FirebaseMethods()
                                      .updateItemCount(snap['productId'], count);
                                  firebase.getCartDetails();
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                              SizedBox(width: Dimensions.width10,),
                            CircleAvatar(
                               backgroundColor: AppColors.mainColor,
                              child: BigText(
                                text: "${snap['itemCount']}",color: Colors.white,
                              ),
                            ),
                            SizedBox(width: Dimensions.width10,),
                            CircleAvatar(
                               backgroundColor: AppColors.mainColor,
                              radius: 12,
                              child: GestureDetector(
                                onTap: () async {
                                  int count = CartController()
                                      .incrementInCart(snap['itemCount']);
                                  await FirebaseMethods()
                                      .updateItemCount(snap['productId'], count);
                                  firebase.getCartDetails();
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  Future<void> _showMyDialog(context,Map<String,dynamic>snap) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Are you sure want to delete ${snap['title']}',
              style: TextStyle(
                fontSize: Dimensions.font20 - 3,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Confirm'),
                onPressed: () async {
                  await FirebaseMethods().deleteCollection(snap['productId']);
                  showCustomSnackBar(
                    '${snap['title']} ',
                    title: 'removed',
                    color: Colors.red,
                  );
                  await firebase.getCartDetails();
                  navigator!.pop();
                },
              ),
            ],
          );
        });
  }
}
