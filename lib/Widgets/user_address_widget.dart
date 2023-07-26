import 'package:flavour_fleet_main/Pages/payment/select_payment_method.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class UserAddressWidget extends StatelessWidget {
  Map<String, dynamic> snap;
  Map<String, dynamic>? productSnap;
  final bool isCart;

  UserAddressWidget({
    super.key,
    required this.snap,
     this.productSnap,
     required this.isCart
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), border: Border.all()),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallText(
            text: snap['name'].toString().toUpperCase(),
            color: Colors.black,
          ),
          const SizedBox(height: 10),
          SmallText(
            text:
                "${snap['address'].toString().toUpperCase()}, ${snap['pincode']}",
            color: Colors.black,
          ),
          const SizedBox(height: 10),
          SmallText(
            text: "phone number : ${snap['phone']}",
            color: Colors.black,
          ),
          const SizedBox(height: 10),
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
                  borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
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
    );
  }
}
