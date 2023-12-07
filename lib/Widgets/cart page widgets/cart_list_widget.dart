import 'package:flavofleet_main/Utils/colors.dart';
import 'package:flavofleet_main/Utils/diamensions.dart';
import 'package:flavofleet_main/Utils/big_text.dart';
import 'package:flavofleet_main/Utils/show_custom_snackbar.dart';
import 'package:flavofleet_main/Widgets/no_internet.dart';
import 'package:flavofleet_main/controller/cart_controller.dart';
import 'package:flavofleet_main/firebase/firebase_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CartListWidget extends StatelessWidget {
  Map<String, dynamic> snap;
  final FirebaseMethods firebase = Get.put(FirebaseMethods());
  final CartController countController = Get.put(CartController());
  CartListWidget({
    super.key,
    required this.snap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: Dimensions.height45*2,
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
                borderRadius: BorderRadius.circular(Dimensions.radius15),
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
                    size: Dimensions.font15 - 3,
                    color: Colors.black54,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: Colors.white),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    bool isConnected =
                        await NoInternetWidget.checkInternetConnectivity();
                    if (isConnected) {
                      await _showMyDialog(context, snap);
                    } else {
                      NoInternetWidget.noInternetConnection(context);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.mainWithLowOpacity,
                        borderRadius: BorderRadius.circular(10)),
                    width: 40,
                    height: double.infinity,
                    child: const Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                GestureDetector(
                  onTap: () async {
                    bool isConnected =
                        await NoInternetWidget.checkInternetConnectivity();
                    if (isConnected) {
                      int count = CartController().decrementInCart(
                        snap['itemCount'],
                        snap['productId'],
                      );
                      await FirebaseMethods()
                          .updateItemCount(snap['productId'], count);
                      firebase.getCartDetails();
                    } else {
                      NoInternetWidget.noInternetConnection(context);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.mainWithLowOpacity,
                        borderRadius: BorderRadius.circular(10)),
                    height: double.infinity,
                    width: 40,
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.mainWithLowOpacity,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: BigText(
                      text: "${snap['itemCount']}",
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                GestureDetector(
                  onTap: () async {
                    int count =
                        CartController().incrementInCart(snap['itemCount']);
                    await FirebaseMethods()
                        .updateItemCount(snap['productId'], count);
                    firebase.getCartDetails();
                  },
                  child: Container(
                   decoration: BoxDecoration(
                    color: AppColors.mainWithLowOpacity,
                    borderRadius: BorderRadius.circular(10),
                  ),
                    height: double.infinity,
                    width: 40,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog(context, Map<String, dynamic> snap) async {
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
                  Navigator.of(context).pop();
                  await FirebaseMethods().removeItemFromCart(snap['productId']);
                  showCustomSnackBar(
                    '${snap['title']} ',
                    title: 'removed',
                    color: Colors.red,
                  );
                  await firebase.getCartDetails();
                },
              ),
            ],
          );
        });
  }
}
