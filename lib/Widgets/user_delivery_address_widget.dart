import 'package:flavour_fleet_main/Pages/payment/select_payment_method.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/Utils/big_text.dart';
import 'package:flavour_fleet_main/Widgets/no_internet.dart';
import 'package:flavour_fleet_main/Widgets/small_text.dart';
import 'package:flavour_fleet_main/firebase/firebase_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class UserAddressWidget extends StatelessWidget {
  Map<String, dynamic> snap;
  Map<String, dynamic>? productSnap;
  final bool isCart;

  UserAddressWidget(
      {super.key, required this.snap, this.productSnap, required this.isCart});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              border: Border.all(),
              borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.height10,
              vertical: Dimensions.height15,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: Dimensions.height20 + 5,
              vertical: 10,
            ),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(text: 'Delivery Address'),
                    IconButton(
                      onPressed: () async {
                        await _showMyDialog(context, snap);
                      },
                      icon: const Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.red,
                        size: 22,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                SmallText(
                  // text: snap['name'].toString().toUpperCase(),
                  text: snap['name'].toString().toUpperCase(),
                  color: Colors.black,
                ),
                const SizedBox(height: 10),
                SmallText(
                  text: "${snap['address']}   ${snap['pincode']}",
                  // "${snap['address'].toString().toUpperCase()}, ${snap['pincode']}",
                  color: Colors.black,
                ),
                const SizedBox(height: 10),
                SmallText(
                  // text: "phone number : ${snap['phone']}",
                  text: snap['phone'],
                  color: Colors.black,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    bool isConnected =
                        await NoInternetWidget.checkInternetConnectivity();
                    if (isConnected) {
                      navigator!.push(MaterialPageRoute(
                        builder: (context) => PaymentMethodSelect(
                          isCart: isCart,
                          snap: snap,
                          productSnap: productSnap!,
                        ),
                      ));
                    } else {
                      NoInternetWidget.noInternetConnection(context);
                    }
                  },
                  child: Container(
                    width: Dimensions.screenWidth,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius20 / 2),
                      color: AppColors.mainColor,
                    ),
                    child: Center(
                      child: BigText(
                        text: 'Use this address',
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// SizedBox(height: Dimensions.screenHeight / 1.8),

Future<void> _showMyDialog(context, Map<String, dynamic> snap) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Do you want to delete this address?',
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
                bool isConnected =
                    await NoInternetWidget.checkInternetConnectivity();
                if (isConnected) {
                  await FirebaseMethods().deleteAddress(snap['id']);
                } else {
                  NoInternetWidget.noInternetConnection(context);
                }
              },
            ),
          ],
        );
      });
}
