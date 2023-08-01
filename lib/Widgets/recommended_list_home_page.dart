import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavour_fleet_main/Pages/Food/recomended_food_details.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/icon_and_text.dart';
import 'package:flavour_fleet_main/Widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedProductListWidget extends StatelessWidget {
  const RecommendedProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      padding: EdgeInsets.only(bottom: Dimensions.height10),
      margin: EdgeInsets.only(bottom: Dimensions.height10),
      height: Dimensions.screenHeight / 2.5,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('recommendedProducts')
                .snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return BigText(text: 'No Items');
              }

              return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return Container(
                      height: Dimensions.height10,
                    );
                  },
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var snap = snapshot.data!.docs[index].data();

                    return Container(
                      margin: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width10,
                      ),
                      child: GestureDetector(
                        onTap: () => navigator!.push(
                          MaterialPageRoute(
                            builder: (context) => RecomendedFoodDetails(
                              snap: snap,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: Dimensions.height45 * 2,
                              height: Dimensions.height45 * 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage("${snap['image']}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: Dimensions.height10,
                                top: Dimensions.height10,
                              ),
                              height: Dimensions.height45 * 2,
                              width: Dimensions.width20 *
                                  12, // overflow error may cause here
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              // container box scrolling

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(
                                    text: snap['title'],
                                    size: Dimensions.font26 / 2 + 3,
                                  ),
                                  SizedBox(height: Dimensions.height5),
                                  Row(
                                    children: [
                                      Wrap(
                                        children: List.generate(
                                          int.parse(snap['star']),
                                          (index) => const Icon(
                                            Icons.star,
                                            color: AppColors.mainColor,
                                            size: 12,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      SmallText(text: snap['rating']),
                                    ],
                                  ),
                                  SizedBox(height: Dimensions.height5),
                                  Row(
                                    children: [
                                      const IconAndTextWidget(
                                        icon: Icons.circle,
                                        text: 'Normal',
                                        iconColor: Colors.orangeAccent,
                                      ),
                                        SizedBox(width: Dimensions.width20),
                                      IconAndTextWidget(
                                        icon: Icons.location_on,
                                        text: '${snap['distance']} Km',
                                        iconColor: Colors.deepOrangeAccent,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
