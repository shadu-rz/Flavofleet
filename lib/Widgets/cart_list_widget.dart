import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flutter/material.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('cart').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return Center(
              child: BigText(text: 'No items found'),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: BigText(text: 'No items found'),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: BigText(text: 'Check your internet connection'),
            );
          }
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(
              height: Dimensions.height10,
            ),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var snap = snapshot.data!.docs[index].data();
              return Container(
                margin: EdgeInsets.only(top: Dimensions.height10),
                // color: Colors.amber,
                height: 100,
                width: double.maxFinite,
                child: Row(
                  children: [
                    Container(
                      width: Dimensions.height20 * 4,
                      height: Dimensions.height20 * 4,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(snap['image']),
                          ),
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: Dimensions.height20 * 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(
                              text: snap['title'],
                              size: Dimensions.font20 - 2,
                              color: Colors.black54,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BigText(
                                  text: '₹ ${snap['price']}',
                                  size: Dimensions.font20 - 2,
                                  color: Colors.redAccent,
                                ),
                                //containerrr
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: Dimensions.height10,
                        bottom: Dimensions.height10,
                        right: Dimensions.width20 / 2,
                        left: Dimensions.width20 / 2,
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: Colors.white),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: const Icon(
                              Icons.remove,
                              color: Colors.grey,
                            ),
                          ),
                          BigText(text: "1"),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.add,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
