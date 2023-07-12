import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

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

  // Stream<List<recommendedProduct>> RecommendedProduct() =>
  //     FirebaseFirestore.instance.collection('recommendedProducts').snapshots();
}
