import 'package:flavofleet_main/Utils/diamensions.dart';
import 'package:flavofleet_main/Widgets/popular%20food%20widgets/popular_food_page_widget.dart';
import 'package:flavofleet_main/Utils/big_text.dart';
import 'package:flavofleet_main/Widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';

class BodyPopFoodDetails extends StatelessWidget {
  const BodyPopFoodDetails({
    super.key,
    required this.snap,
  });

  final Map<String, dynamic> snap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: Dimensions.populaFoodImageSize - 20,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(
          left: Dimensions.width20,
          right: Dimensions.width20,
          top: Dimensions.height20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PopularFoodPageWidget(
              text: snap['title'],
              snap: snap,
            ),
            SizedBox(height: Dimensions.height20),
            BigText(text: 'Indroduce'),
            SizedBox(height: Dimensions.height10),

            // expandable text widget
            Expanded(
              child: SingleChildScrollView(
                child: ExpandableTextWidget(
                  text: (snap['description']),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
