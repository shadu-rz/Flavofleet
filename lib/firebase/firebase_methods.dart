import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fleet_main/Widgets/show_custom_snackbar.dart';
import 'package:flavour_fleet_main/model/address_model.dart';
import 'package:flavour_fleet_main/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  Future<void> addToCart(CartModel cartModel) async {
    try {
      await firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('cart')
          .doc(cartModel.productId)
          .set(cartModel.toJson());

      showCustomSnackBar('Added to Cart successfull',
          title: 'cart', color: Colors.green, position: SnackPosition.BOTTOM);
    } catch (e) {
      log(e.toString());
    }
  }

  // add to cart recommended product

  Future<void> updateItemCount(String id, int count)async{
    try {
      await firestore.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('cart').doc(id).update({
        'itemCount':count,
      });
    } catch (e) {
      log(e.toString());
    }
  }

  // to check is it already existing in the cart

  Future<bool> alreadyExistInCart(String uId, String title) async {
    try {
      QuerySnapshot<Map<String, dynamic>> doc =
          await firestore.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('cart').get();
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

  RxInt observecartLength = RxInt(1);
  RxNum observetotalPrice = RxNum(0);

  Future<void> getCartDetails() async {
    observetotalPrice.value = 0;
    // CartController controller = Get.put(CartController());
    // final count = controller.count;
    try {
      QuerySnapshot<Map<String, dynamic>> snap =
          await firestore.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('cart').get();
      
      observecartLength.value = snap.docs.length;

      for (var element in snap.docs) {
        double total = element['price']*element['itemCount'];
        log(total.toString());
        observetotalPrice.value = observetotalPrice.value + total;
      }
      // log(observecartLength.toString());
      // log(observetotalPrice.toString());
    } catch (e) {
      log("errorr ${e.toString()}");
    }
  }

  // delete collection

  Future<void> deleteCollection(String productId) async {
    log(productId);
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('cart')
        .doc(productId)
        .get();
    await doc.reference.delete();
  }



  Future<void> addAddress(AddressModel address) async {
    String id = Uuid().v1();
    try {
      await firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('delivery_address')
          .doc(id)
          .set(address.toJson());
    } catch (e) {
      log(e.toString());
    }
  }
}
