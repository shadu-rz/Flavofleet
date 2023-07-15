import 'dart:developer';
import 'package:flavour_fleet_main/Widgets/show_custom_snackbar.dart';
import 'package:flavour_fleet_main/model/recommended_product_mode.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavour_fleet_main/model/popular_product_model.dart';

class FirebaseMethods extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
  

  Future<void> addToCartPopular(PopularProductModel productModel)async{
    try {
      String id =const  Uuid().v1();
      await firestore.collection('cart').doc(id).set(productModel.toJson());
      log('Popular product add to cart success');
      showCustomSnackBar('Added to Cart successfull',title: 'cart');
      
    } catch (e) {
      log(e.toString());
    }
  }
  Future<void> addToCartRecommended(RecommendedProductModel productModel)async{
    try {
      String id =const  Uuid().v1();
      await firestore.collection('cart').doc(id).set(productModel.toJson());
      log('Recommende product add to cart success');
      showCustomSnackBar('Added to Cart successfull',title: 'cart');
      
    } catch (e) {
      log(e.toString());
    }
  }


  Future<bool> alreadyExistInCart(String uId, String title)async{
    try {
      QuerySnapshot<Map<String,dynamic>> doc = await firestore.collection('cart').get();
      for (var element in doc.docs) {
        // log(element['title']);
        if (element['title']==title && element['uId']==uId) {
          return true;
        }
      }
      return false;
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  // int cartLength = 0 ;
  RxInt observecartLength = RxInt(0);
  // double totalPrice =0;
  RxNum observetotalPrice = RxNum(0);
  Future<void>getCartDetails()async{
    observetotalPrice.value=0;
    try {
      QuerySnapshot<Map<String,dynamic>> snap =await firestore.collection('cart').get();
      observecartLength.value = snap.docs.length;
      for (var element in snap.docs) {
       observetotalPrice.value=observetotalPrice.value + element['price'] ;
      }
      log(observecartLength.toString());
      log(observetotalPrice.toString());
    } catch (e) {
      log("errorr ${e.toString()}");
    }
  }

}
