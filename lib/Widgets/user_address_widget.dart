import 'package:flavour_fleet_main/Pages/payment/select_payment_method.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
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
                borderRadius: BorderRadius.circular(10), border: Border.all()),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.maxFinite,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SmallText(
                          text: snap['name'].toString().toUpperCase(),
                          color: Colors.black,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${snap['address'].toString().toUpperCase()}, ${snap['pincode']}",
                          style:const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SmallText(
                          text: "phone number : ${snap['phone']}",
                          color: Colors.black,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
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
                GestureDetector(
                  onTap: () {
                    navigator!.push(MaterialPageRoute(
                      builder: (context) => PaymentMethodSelect(
                        isCart: isCart,
                        snap: snap,
                        productSnap: productSnap!,
                      ),
                    ));
                  },
                  child: Container(
                    width: Dimensions.screenWidth,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20 / 2),
                        color: AppColors.mainColor),
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
                await FirebaseMethods().deleteAddress(snap['id']);
                navigator!.pop();
              },
            ),
          ],
        );
      });
}
