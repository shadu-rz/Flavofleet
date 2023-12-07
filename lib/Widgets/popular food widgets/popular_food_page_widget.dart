
import 'package:flavofleet_main/Widgets/small_text.dart';
import 'package:flutter/material.dart';
import '../../Utils/colors.dart';
import '../../Utils/diamensions.dart';
import '../../Utils/big_text.dart';
import '../icon_and_text.dart';

class PopularFoodPageWidget extends StatelessWidget {
  final String text;
  const PopularFoodPageWidget({
    super.key,
    required this.text,
    required this.snap,
  });
  final Map<String, dynamic> snap;
  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            BigText(
              text: text,
              size: Dimensions.font26,
            ),
            SizedBox(width: Dimensions.width20),
            BigText(
              text: "₹${snap['price']}",
              size: Dimensions.font20,
            ),
            
           
          ],
        ),
        SizedBox(height: Dimensions.height10),
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
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            const IconAndTextWidget(
              icon: Icons.circle_sharp,
              text: 'Normal',
              iconColor: Colors.orangeAccent,
            ),
            SizedBox(width: Dimensions.width20),
            IconAndTextWidget(
              icon: Icons.location_on,
              text: '${snap['distance']} km',
              iconColor: Colors.deepOrangeAccent,
            ),
            SizedBox(width: Dimensions.width20 * 1.5),
            IconAndTextWidget(
              icon: Icons.access_time_filled_rounded,
              text: '${snap['time']} min',
              iconColor: Colors.brown,
            ),
          ],
        )
      ],
    );
  }
}
