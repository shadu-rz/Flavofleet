import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/order_status_widget.dart';
import 'package:flavour_fleet_main/Widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderStatusPage extends StatelessWidget {
  const OrderStatusPage({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BigText(text: 'Order Details'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('orders')
            .doc(productId)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            log("some error");
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text('No data'),
            );
          }
          Map<String, dynamic>? snap = snapshot.data!.data();
          DateTime date = (snap!['date'] as Timestamp).toDate();
          String amount = calculateTotalPrice(snap['itemCount'] ?? 1, snap['price']);
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BigText(text: snap['title'].toString().toUpperCase()),
                  Column(
                    children: [
                      
                      BigText(
                        text: "₹ ${amount}",
                        size: 20,
                        color: Colors.green,
                      ),
                      snap['itemCount'] != null
                          ? BigText(
                              text: "${snap['itemCount'].toString()} items",
                              size: 16,
                              color: Colors.grey,
                            )
                          : const SizedBox(),
                    ],
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          snap['image'],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Dimensions.height20),
              OrderStatusWidget(
                title: 'Order recived ${DateFormat.jm().format(date)}',
                isChecked: snap['orderRecived'],
              ),
              OrderStatusWidget(
                title: 'Preparing',
                isChecked: snap['preparing'],
              ),
              OrderStatusWidget(
                title: 'Out of delivery',
                isChecked: snap['outOfDelivery'],
              ),
              OrderStatusWidget(
                title: 'Delivered',
                isChecked: snap['delivered'],
              ),
              SizedBox(
                height: Dimensions.height45,
              ),
              FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('delivery_address')
                      .doc(snap['selectedAddress'])
                      .get(),
                  builder: (context,
                      AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      log("some error");
                    }

                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text('No data'),
                      );
                    }
                    var snapp = snapshot.data!.data();
                    return Container(
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(10),
                        border: Border.all(),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: Dimensions.height20 + 5,
                        vertical: 10,
                      ),
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: 'Delivery Address'),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          SmallText(
                            // text: snap['name'].toString().toUpperCase(),
                            text: snapp!['name'].toString().toUpperCase(),
                            color: Colors.black,
                          ),
                          const SizedBox(height: 10),
                          SmallText(
                            text: "${snapp['address']}   ${snapp['pincode']}",
                            // "${snap['address'].toString().toUpperCase()}, ${snap['pincode']}",
                            color: Colors.black,
                          ),
                          const SizedBox(height: 10),
                          SmallText(
                            // text: "phone number : ${snap['phone']}",
                            text: snapp['phone'],
                            color: Colors.black,
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    );
                  })
            ],
          );
        },
      ),
    );
  }
  calculateTotalPrice(num itemCount,num price ) {
    num totalPrice;
    totalPrice = price*itemCount;
    return totalPrice.floor().toString();
  }
}
