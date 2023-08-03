import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fleet_main/Pages/address/add_new_address_page.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/Utils/big_text.dart';
import 'package:flavour_fleet_main/Widgets/user_delivery_address_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SelectAddress extends StatelessWidget {
  final bool isCart;
  final Map<String, dynamic>? productSnap;

  SelectAddress({
    super.key,
    this.productSnap,
    required this.isCart,
  });
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> snapp = productSnap ?? {};

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                navigator!.pop();
              },
              child: BigText(text: 'cancel'))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('delivery_address')
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: BigText(text: 'No Adress found'),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: BigText(text: 'Check your internet'),
            );
          }

          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  navigator!.push(MaterialPageRoute(
                    builder: (context) => AddAddressPage(
                      productSnap: productSnap,
                    ),
                  ));
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.height20),
                  width: Dimensions.screenWidth,
                  height: Dimensions.screenHeight / 14,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius20 / 2),
                      color: Colors.blueGrey),
                  child: Center(
                    child: BigText(
                      text: 'Add new address',
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var snap = snapshot.data!.docs[index].data();
                    return UserAddressWidget(
                      isCart: isCart,
                      productSnap: snapp,
                      snap: snap,
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
