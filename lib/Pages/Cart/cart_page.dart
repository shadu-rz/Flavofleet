import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavofleet_main/Utils/colors.dart';
import 'package:flavofleet_main/Utils/diamensions.dart';
import 'package:flavofleet_main/Utils/big_text.dart';
import 'package:flavofleet_main/Widgets/cart%20page%20widgets/bottom_nav_cart.dart';
import 'package:flavofleet_main/Widgets/cart%20page%20widgets/cart_list_widget.dart';
import 'package:flavofleet_main/Utils/show_custom_snackbar.dart';
import 'package:flavofleet_main/Widgets/is_guest_mode.dart';
import 'package:flavofleet_main/firebase/firebase_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  final bool isGuest;
  final FirebaseMethods firebase = Get.put(FirebaseMethods());
  CartPage({super.key, required this.isGuest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        title: BigText(text: 'Cart', color: Colors.white),
        actions: [
          Visibility(
            visible: !isGuest,
            child: IconButton(
                tooltip: 'Clear all',
                onPressed: () async {
                  if (firebase.cartLength <= 0) {
                    return;
                  } else {
                    await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Are you sure want to delete ?',
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
                                  await firebase.clearCart();
                                  await firebase.getCartDetails();
                                  showCustomSnackBar(
                                    'All items cleared',
                                    title: 'success',
                                    color: Colors.green,
                                    position: SnackPosition.BOTTOM,
                                  );
                                  navigator!.pop();
                                },
                              ),
                            ],
                          );
                        });
                  }
                },
                icon: const Icon(Icons.clear_all_rounded)),
          )
        ],
      ),
      body: isGuest
          ? const IsGuestMode()
          : Stack(
              children: [
                Positioned(
                  left: Dimensions.width10+2,
                  right: Dimensions.width10+2,
                  top: Dimensions.height10,
                  bottom: 0,
                  child: Container(
                    color: Colors.white,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection('cart')
                              .snapshots(),
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                  snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
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
                                child: BigText(
                                    text: 'Check your internet connection'),
                              );
                            }
                            return ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: Dimensions.height10,
                              ),
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                var snap = snapshot.data!.docs[index].data();
                                return CartListWidget(
                                  snap: snap,
                                );
                              },
                              itemCount: snapshot.data!.docs.length,
                            );
                          }),
                    ),
                  ),
                ),
                //nav bar
                BottomNavCart(isGuest: isGuest)
              ],
            ),
    );
  }
}