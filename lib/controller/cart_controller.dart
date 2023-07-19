import 'package:flavour_fleet_main/Widgets/show_custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  
   var count = 1.obs;

  void increment() {
    if (count>=15) {
      showCustomSnackBar("you can't add more than 15",title: 'Limit reached',color: Colors.red);
    } else{
       count.value++;
    }
  }

  void decrement() {
    if (count>1) {
       count.value--;
    }else{
      showCustomSnackBar("you can't less than 1",title: 'Minimun count',color: Colors.red); 
    }
   
  }
}