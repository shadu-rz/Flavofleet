import 'package:firebase_auth/firebase_auth.dart';

import 'package:flavofleet_main/Pages/order/ordered_successfully.dart';
import 'package:flavofleet_main/Utils/colors.dart';
import 'package:flavofleet_main/Utils/big_text.dart';
import 'package:flavofleet_main/Widgets/no_internet.dart';
import 'package:flavofleet_main/Widgets/small_text.dart';
import 'package:flavofleet_main/firebase/firebase_methods.dart';
import 'package:flavofleet_main/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class PlaceOrder extends StatelessWidget {
  Map<String, dynamic> snap;
  Map<String, dynamic>? productSnap;
  final bool isCart;

  PlaceOrder({
    super.key,
    required this.snap,
    this.productSnap,
    required this.isCart,
  });
  final FirebaseMethods firebase = Get.put(FirebaseMethods());
  late RxNum total = firebase.totalPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: SmallText(
          text: 'Order Now',
          color: AppColors.mainBlackColor,
          size: 18,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), border: Border.all()),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 110,
            width: double.maxFinite,
            child: Column(
              children: [
                Row(
                  children: [
                    SmallText(
                      text: 'Items :',
                      color: AppColors.mainBlackColor,
                    ),
                    const Spacer(),
                    SmallText(
                      text: '₹ $total',
                      color: AppColors.mainBlackColor,
                      size: 15,
                    )
                  ],
                ),
                Row(
                  children: [
                    SmallText(
                      text: 'Delivery charge:',
                      color: AppColors.mainBlackColor,
                    ),
                    const Spacer(),
                    SmallText(
                      text: '₹ 0',
                      color: AppColors.mainBlackColor,
                      size: 15,
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    BigText(
                      text: 'Order Total :',
                      color: Colors.red,
                    ),
                    const Spacer(),
                    BigText(
                      text: '₹ $total',
                      color: Colors.red,
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), border: Border.all()),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(
                  text: snap['name'].toString().toUpperCase(),
                  color: Colors.black,
                  size: 14,
                ),
                const SizedBox(height: 10),
                SmallText(
                  text:
                      "${snap['address'].toString().toUpperCase()}, ${snap['pincode']}",
                  color: Colors.black,
                ),
                const SizedBox(height: 10),
                SmallText(
                  text: "phone number : ${snap['phone']}",
                  color: Colors.black,
                  size: 14,
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () async {
              bool isConnected =
                  await NoInternetWidget.checkInternetConnectivity();
              if (isConnected) {
                if (isCart) {
                  await FirebaseMethods().cartToOrder(snap['id']);
                  await FirebaseMethods().clearCart();
                  await FirebaseMethods().getCartDetails();

                  navigator!.push(MaterialPageRoute(
                    builder: (context) => const OrderdSuccessfully(),
                  ));
                } else {
                  String id = const Uuid().v1();
                  OrderModel order = OrderModel(
                    selectedAddress: snap['id'],
                    delivered: false,
                    orderRecived: true,
                    outOfDelivery: false,
                    preparing: false,
                    title: productSnap!['title'],
                    price: double.parse(productSnap!['price']),
                    date: DateTime.now(),
                    image: productSnap!['image'],
                    productId: id,
                    uId: FirebaseAuth.instance.currentUser!.uid,
                  );

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const OrderdSuccessfully(),
                  ));
                  await FirebaseMethods().addToOrder(order);
                }
              } else {
                NoInternetWidget.noInternetConnection(context);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all()),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: 40,
              width: double.maxFinite,
              child: Center(
                child: BigText(
                  text: 'Place your order',
                  size: 18,
                  color: AppColors.mainBlackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
