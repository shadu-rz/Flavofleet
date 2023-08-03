import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/Utils/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(
  String message, {
  bool isError = true,
  String title = 'Error,',
  Color color = const Color.fromARGB(255, 116, 185, 181),
  SnackPosition position = SnackPosition.BOTTOM,
}) {
  Get.snackbar(
    duration: const Duration(milliseconds: 1250),
    margin: EdgeInsets.only(
      bottom: Dimensions.height20,
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
      style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
    ),
    colorText: Colors.white,
    snackPosition: position,
    backgroundColor: color.withOpacity(0.5),
  );
}
