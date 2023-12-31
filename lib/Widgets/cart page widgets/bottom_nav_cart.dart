import 'package:flavofleet_main/Pages/address/select_address.dart';
import 'package:flavofleet_main/Utils/colors.dart';
import 'package:flavofleet_main/Utils/diamensions.dart';
import 'package:flavofleet_main/Utils/big_text.dart';
import 'package:flavofleet_main/Utils/show_custom_snackbar.dart';
import 'package:flavofleet_main/Widgets/no_internet.dart';
import 'package:flavofleet_main/firebase/firebase_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavCart extends StatelessWidget {
  final bool isGuest;
  final FirebaseMethods firebase = Get.put(FirebaseMethods());
  BottomNavCart({super.key, required this.isGuest});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      firebase.getCartDetails();
    });
    return Positioned(
        bottom: double.minPositive,
        child: Container(
          height: Dimensions.height10 * 6,
          width: Dimensions.screenWidth,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: Dimensions.height20 * 2,
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(Dimensions.radius15)),
                child: Center(
                  child: Obx(
                    () => BigText(
                      text:
                          "${firebase.cartLength} ${toCheckOneOrMore() ? 'items' : 'item'}",
                      size: Dimensions.font20 / 1.2,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                margin: const EdgeInsets.only(bottom: 10),
                height: Dimensions.height20 * 2,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(Dimensions.radius15)),
                child: Center(
                  child: Obx(
                    () => BigText(
                      text: firebase.cartLength <= 0
                          ? "₹ 0"
                          : "₹ ${firebase.totalPrice}",
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  bool isConnected = await NoInternetWidget.checkInternetConnectivity();
                  if (isConnected) {
                    if (firebase.cartLength <= 0) {
                      showCustomSnackBar('No items in cart',
                          title: 'cart', color: Colors.red);
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SelectAddress(
                            isGuest: isGuest,
                            isCart: true,
                          ),
                        ),
                      );
                    }
                  } else {
                   NoInternetWidget.noInternetConnection(context);
                  }
                },
                child: Container(
                  height: Dimensions.font20 * 2,
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius15)),
                  child: Center(
                    child: BigText(
                      text: 'Check Out',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }



  bool toCheckOneOrMore() {
    if (firebase.cartLength > 1) {
      return true;
    }
    return false;
  }
}



