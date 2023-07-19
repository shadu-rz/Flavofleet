import 'package:flavour_fleet_main/Pages/Food/popular_food_details.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/icon_and_text.dart';
import 'package:flavour_fleet_main/Widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorizontalScrollWidget extends StatelessWidget {
  const HorizontalScrollWidget({
    super.key,
    required this.snap,
  });
  final Map<String, dynamic> snap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius15),
        // color: Colors.white38,
      ),
      child: GestureDetector(
        onTap: () {
          navigator!.push(
            MaterialPageRoute(
              
              builder: (context) => PopularFoodDetails(
                snap: snap,
                
              ),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              height: Dimensions.screenWidth / 2,
              width: Dimensions.screenWidth / 1.3,
              margin: EdgeInsets.only(
                  left: Dimensions.width10,
                  right: Dimensions.width10,
                  top: Dimensions.height10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(snap['image']),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.screenWidth / 4.3,
                width: Dimensions.screenWidth / 1.45,
                margin: EdgeInsets.only(
                  left: Dimensions.height10,
                  right: Dimensions.height20,
                  bottom: Dimensions.height20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  color: Colors.white,
                ),
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height10,
                      left: Dimensions.height15,
                      right: Dimensions.height15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: snap['title'],
                        size: 16,
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
                                size: 15,
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
                            icon: Icons.circle_sharp,
                            text: 'Normal',
                            iconColor: Colors.orangeAccent,
                          ),
                          IconAndTextWidget(
                            icon: Icons.location_on,
                            text: '${int.parse(snap['distance'])} km',
                            iconColor: Colors.deepOrangeAccent,
                          ),
                          const SizedBox(width: 10),
                          IconAndTextWidget(
                            icon: Icons.access_time_filled_rounded,
                            text: '${int.parse(snap['time'])} min',
                            iconColor: Colors.brown,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
