import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fleet_main/Widgets/Utils/show_custom_snackbar.dart';
import 'package:flavour_fleet_main/model/address_model.dart';
import 'package:flavour_fleet_main/model/cart_model.dart';
import 'package:flavour_fleet_main/model/favorite_model.dart';
import 'package:flavour_fleet_main/model/order_model.dart';
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

  // add to cart

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

  //update item count

  Future<void> updateItemCount(String id, int count) async {
    try {
      await firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('cart')
          .doc(id)
          .update({
        'itemCount': count,
      });
    } catch (e) {
      log(e.toString());
    }
  }

  // to check is it already existing in the cart

  Future<bool> alreadyExistInCart(String uId, String title) async {
    try {
      QuerySnapshot<Map<String, dynamic>> doc = await firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('cart')
          .get();
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

  RxInt cartLength = RxInt(1);
  RxNum totalPrice = RxNum(0);
  
    Future<void> getSelectedProduct(String collection, String productId) async {
    totalPrice.value = 0;
    try {
      DocumentSnapshot<Map<String, dynamic>> snap =
          await firestore.collection(collection).doc(productId).get();
      totalPrice.value = double.parse(snap['price']);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getCartDetails() async {

    totalPrice.value = 0;
    try {
      QuerySnapshot<Map<String, dynamic>> snap = await firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('cart')
          .get();

      cartLength.value = snap.docs.length;

      for (var element in snap.docs) {
        double total = element['price'] * element['itemCount'];
        totalPrice.value = totalPrice.value + total;
      }
    } catch (e) {
      log("errorr ${e.toString()}");
    }
  }

  // delete 1 item from cart

  Future<void> removeItemFromCart(String productId) async {
    try {
      log(productId);
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('cart')
          .doc(productId)
          .get();
      await doc.reference.delete();
    } catch (e) {
      log(e.toString());
    }
  }

  // clear cart

  Future<void> clearCart() async {
    try {
      final CollectionReference collectionReference = FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('cart');
      final QuerySnapshot querySnapshot = await collectionReference.get();

      for (var document in querySnapshot.docs) {
        document.reference.delete();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  //ADD ADDRESS

  Future<void> addAddress(AddressModel address) async {
    
    try {
      await firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('delivery_address')
          .doc(address.id)
          .set(address.toJson());
    } catch (e) {
      log(e.toString());
    }
  }
  // delete address
   Future<void> deleteAddress(String id) async {
    try {
      DocumentReference addressRef = firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('delivery_address')
        .doc(id);
    await addressRef.delete();
    navigator!.pop();
    } catch (e) {
      log(e.toString());
    }
  }

  // add to order from cart

  Future<void> cartToOrder(String selectedAddress) async {
    try {
      final CollectionReference sourceCollectionRef = firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('cart');

      final CollectionReference destinationCollectionRef =
          firestore.collection('orders');

      QuerySnapshot snap = await sourceCollectionRef.get();

      log(snap.docs.length.toString());

      for (var element in snap.docs) {

        String id = const Uuid().v1();

        OrderModel order = OrderModel(
          delivered: false,
          orderRecived: true,
          outOfDelivery: false,
          preparing: false,
          price: element['price'],
          title: element['title'],
          date: DateTime.now(),
          image: element['image'],
          productId: id,
          uId: element['uId'],
          selectedAddress: selectedAddress,
          itemCount: element['itemCount'],
        );
        destinationCollectionRef.doc(id).set(order.toJson());
      }
      showCustomSnackBar('Successfull',
          title: 'Order', color: Colors.green, position: SnackPosition.TOP);
    } catch (e) {
      log(e.toString());
    }
  }

  //add to order

  Future<void> addToOrder(OrderModel orderModel) async {
    try {
      await firestore
          .collection('orders')
          .doc(orderModel.productId)
          .set(orderModel.toJson());

      showCustomSnackBar('Successfull',
          title: 'Order', color: Colors.green, position: SnackPosition.TOP);
    } catch (e) {
      log(e.toString());
    }
  }

    // add to favorite

  Future<void> addToFav(FavoriteModel favModel) async {
    try {
      await firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('favorite')
          .doc(favModel.productId)
          .set(favModel.toJson());
          
      showCustomSnackBar('Added to favorite successfull',
          title: 'Favorite', color: Colors.green, position: SnackPosition.BOTTOM);
    } catch (e) {
      log(e.toString());
    }
  }

    // to check is it already existing in the favorite

  Future<bool> alreadyExistInFavorite(String uId, String title) async {
    try {
      QuerySnapshot<Map<String, dynamic>> doc = await firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('favorite')
          .get();
      for (var element in doc.docs) {
        // log(element['title']);
        if (element['title'] == title && element['uId'] == uId) {
          return true;
        }
      }
      return false;
    } catch (e) {
      log( "error in checking fav ${e.toString()}");
    }
    return false;
  }

    // delete 1 item from favorite

  Future<void> removeItemFromFavorite(String productId) async {
    try {
      log(productId);
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('favorite')
          .doc(productId)
          .get();
      await doc.reference.delete();
    } catch (e) {
      log(e.toString());
    }
  }
}
