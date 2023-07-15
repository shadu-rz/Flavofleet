import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String message,
    {bool isError = true, String title = 'Error,'}) {
  Get.snackbar(
      duration: const Duration(milliseconds: 1250),
      margin: EdgeInsets.only(
        top: Dimensions.height20,
        right: Dimensions.height10,
        left: Dimensions.height10,
      ),
      title,
      message,
      titleText: BigText(
        text: title,
        color: Colors.white,
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.mainColor);
}
