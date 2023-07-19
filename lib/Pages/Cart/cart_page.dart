import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/bottom_nav_cart.dart';
import 'package:flavour_fleet_main/Widgets/cart_list_widget.dart';
import 'package:flavour_fleet_main/Widgets/show_custom_snackbar.dart';
import 'package:flavour_fleet_main/firebase/firebase_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  final FirebaseMethods firebase = Get.put(FirebaseMethods());
   CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        title: BigText(text: 'Cart', color: Colors.white),
        actions: [
          IconButton(
              onPressed: () async {
                return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          'Do you want to clear all items in cart?',
                          style: TextStyle(
                            fontSize: Dimensions.font20 - 3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Confirm'),
                            onPressed: () async {
                              final CollectionReference collectionReference =
                                  FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('cart');
                              final QuerySnapshot querySnapshot = await collectionReference.get();

                              for (var document in querySnapshot.docs) {
                                document.reference.delete();
                              }
                              firebase.getCartDetails();
                              showCustomSnackBar('All items cleared',
                                  title: 'success',
                                  color: Colors.green,
                                  position: SnackPosition.TOP);
                              navigator!.pop();
                            },
                          ),
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.clear_all_rounded))
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height10,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(bottom: Dimensions.height30 * 2),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child:  CartListWidget(),
              ),
            ),
          ),
          //nav bar
          BottomNavCart()
        ],
      ),
    );
  }
}
