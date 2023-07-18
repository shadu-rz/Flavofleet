import 'dart:developer';
import 'package:flavour_fleet_main/Widgets/show_custom_snackbar.dart';
import 'package:flavour_fleet_main/model/recommended_product_mode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavour_fleet_main/model/popular_product_model.dart';

class FirebaseMethods extends GetxController {

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // add user details
  Future<String> addUserDetails(
      {required String email,
      required String image,
      required String username,
      required String uId,
      required String phoneNumber}) async {
    String res = "some error occured";
    try {
      await firestore.collection('users').doc(uId).set({
        "username": username,
        "email": email,
        "image": image,
        "phoneNumber": phoneNumber,
        "uId": uId
      });
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    log(res);
    return res;
  }


  // add to cart popular product
  Future<void> addToCartPopular(PopularProductModel productModel) async {
    try {
      await firestore.collection('cart').doc(productModel.productId).set(productModel.toJson());

      showCustomSnackBar('Added to Cart successfull',
          title: 'cart', color: Colors.green, position: SnackPosition.BOTTOM);
    
      
    } catch (e) {
      log(e.toString());
    }
  }


  // add to cart recommended product

  Future<void> addToCartRecommended(
      RecommendedProductModel productModel) async {
    try {
      await firestore
          .collection('cart')
          .doc(productModel.productId)
          .set(productModel.toJson());

      log('Recommende product add to cart success');
      showCustomSnackBar('Added to Cart successfull',
          title: 'cart', color: Colors.green,position: SnackPosition.BOTTOM);
    } catch (e) {
      log(e.toString());
    }
  }



  // to check is it already existing in the cart

  Future<bool> alreadyExistInCart(String uId, String title) async {
    try {
      QuerySnapshot<Map<String, dynamic>> doc =
          await firestore.collection('cart').get();
      for (var element in doc.docs) {
        // log(element['title']);
        if (element['title'] == title && element['uId'] == uId) {
          return true;
        }
      }
      return false;
    } catch (e) {
      log(e.toString());
    }
    return false;
  }



  // Get cart details

  RxInt observecartLength = RxInt(0);
  RxNum observetotalPrice = RxNum(0);

  Future<void> getCartDetails() async {
    observetotalPrice.value = 0;
    try {
      QuerySnapshot<Map<String, dynamic>> snap =
          await firestore.collection('cart').get();

      observecartLength.value = snap.docs.length;

      for (var element in snap.docs) {
        observetotalPrice.value = observetotalPrice.value + element['price'];
      }
      log(observecartLength.toString());
      log(observetotalPrice.toString());
    } catch (e) {
      log("errorr ${e.toString()}");
    }
  }



  // delete collection

  Future<void> deleteCollection(String productId) async {
    log(productId);
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('cart')
        .doc(productId)
        .get();
    await doc.reference.delete();
  }




  //   RxBool isExistInCart = RxBool(false);
  // Future containsInCart(String imageUrl)async{

  //   QuerySnapshot doc = await firestore.collection('cart').get();
  //   // DocumentSnapshot docSnap = await docRef.get();
  //   for (var element in doc.docs) {
  //     if (element['image']==imageUrl) {
  //     isExistInCart = RxBool(true);
  //     return ;
  //   }
  //   
  
  // isExistInCart = RxBool(false);

  // }
}
