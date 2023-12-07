import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavofleet_main/Pages/order/order_status_page.dart';
import 'package:flavofleet_main/Utils/colors.dart';
import 'package:flavofleet_main/Utils/diamensions.dart';
import 'package:flavofleet_main/Utils/big_text.dart';
import 'package:flavofleet_main/Widgets/is_guest_mode.dart';
import 'package:flavofleet_main/Widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderPage extends StatelessWidget {
  final bool isGuest;
  const OrderPage({super.key, required this.isGuest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isGuest
          ? const IsGuestMode()
          : Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image/food8.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Orders',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('orders')
                            .where('uId',
                                isEqualTo:
                                    FirebaseAuth.instance.currentUser!.uid)
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (snapshot.hasError) {
                            log("some error");
                          }

                          if (!snapshot.hasData) {
                            return const Center(
                              child: Text('No items'),
                            );
                          }
                          if (snapshot.data!.docs.isEmpty) {
                            return Center(
                              child: BigText(text: 'No items found'),
                            );
                          }
                          return ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return Container(
                                height: 0,
                                color: Colors.white,
                              );
                            },
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> snap =
                                  snapshot.data!.docs[index].data();
                              DateTime date =
                                  (snap['date'] as Timestamp).toDate();

                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => OrderStatusPage(
                                      productId: snap['productId'],
                                    ),
                                  ));
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: Dimensions.width10 + 5,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: Dimensions.width10,
                                          ),
                                          Container(
                                            width: Dimensions.height20 * 3,
                                            height: Dimensions.height20 * 3,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                    NetworkImage(snap['image']),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius15),
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: Dimensions.width20,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snap['title']
                                                    .toString()
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SmallText(
                                                text:
                                                    "${DateFormat.yMMMEd().format(date)} \n ${DateFormat.jm().format(date)}",
                                                color: Colors.black,
                                                size: 16,
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          SmallText(
                                            text: "₹ ${snap['price']}",
                                            size: 18,
                                            color: Colors.black,
                                          ),
                                          const Spacer(),
                                          const SizedBox(
                                            height: 120,
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 0,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                  )
                ],
              ),
            ),
    );
  }
}
