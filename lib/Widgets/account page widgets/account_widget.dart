import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/app_icon.dart';
import 'package:flavour_fleet_main/Widgets/Utils/big_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;
  Color containColor;

  AccountWidget({super.key, required this.appIcon, required this.bigText,this.containColor=Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
     margin: EdgeInsets.only(
          left: Dimensions.width20,
          right: Dimensions.width20
          ),
      padding: EdgeInsets.only(
          left: Dimensions.width20,
          top: Dimensions.width10,
          bottom: Dimensions.width10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius15),
        color: containColor,
        boxShadow: [BoxShadow(
          blurRadius: 2,
          offset: const Offset(0, 5),
          color: Colors.grey.withOpacity(0.2)
        )]
      ),
      child: Row(
        children: [
          appIcon,
          SizedBox(
            width: Dimensions.width20,
          ),
          bigText
        ],
      ),
    );
  }
}
