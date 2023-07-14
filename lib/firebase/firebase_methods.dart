import 'dart:developer';
import 'package:flavour_fleet_main/Widgets/show_custom_snackbar.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavour_fleet_main/model/popular_product_model.dart';

class FirebaseMethods {
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
  

  Future<void> addToCart(PopularProductModel productModel)async{

    try {
      String id =const  Uuid().v1();
      await firestore.collection('cart').doc(id).set(productModel.toJson());
      log('add to cart success');
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

}
