import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fleet_main/Pages/order/order_status_page.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/Utils/big_text.dart';
import 'package:flavour_fleet_main/Widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: 'Orders',
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 120,
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('orders')
                      .where('uId',
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
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
                          height: 1,
                          color: Colors.grey,
                        );
                      },
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                         Map<String,dynamic> snap= snapshot.data!.docs[index].data();
                         DateTime date= (snap['date'] as Timestamp).toDate();
                         
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>  OrderStatusPage(productId: snap['productId'],),
                            ));
                          },
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: Dimensions.height20 * 3,
                                      height: Dimensions.height20 * 3,
                                      decoration: BoxDecoration(
                                          image:  DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                               snap['image']
                                               ),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius15),
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: Dimensions.width20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SmallText(
                                          text: snap['title'].toString().toUpperCase(),
                                          color: AppColors.mainBlackColor,
                                          size: 16,
                                        ),
                                        SmallText(
                                          text: "${DateFormat.yMMMEd().format(date)} \n ${DateFormat.jm().format(date)}",
                                          color: AppColors.mainBlackColor,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    SmallText(text: "₹ ${snap['price']}",size: 18,color: Colors.blueGrey,),
                                    // const Spacer(),
                                    // SmallText(text: "2 items",size: 16,color: Colors.black45),
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
            ),
          )
        ],
      ),
    );
  }
}
