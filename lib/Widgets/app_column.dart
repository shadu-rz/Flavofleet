import 'package:flavour_fleet_main/Widgets/small_text.dart';
import 'package:flutter/material.dart';

import 'Utils/colors.dart';
import 'Utils/diamensions.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(height: Dimensions.height5),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15,
                ),
              ),
            ),
            const SizedBox(width: 10),
            SmallText(text: '4.5'),
            const SizedBox(width: 10),
            SmallText(text: '1282'),
            const SizedBox(width: 10),
            SmallText(text: 'comments')
          ],
        ),
        SizedBox(height: Dimensions.height5),
        Row(
          children: const [
            IconAndTextWidget(
              icon: Icons.circle_sharp,
              text: 'Normal',
              iconColor: Colors.orangeAccent,
            ),
            IconAndTextWidget(
              icon: Icons.location_on,
              text: '1.7 Km',
              iconColor: Colors.deepOrangeAccent,
            ),
            SizedBox(width: 10),
            IconAndTextWidget(
              icon: Icons.access_time_filled_rounded,
              text: '32 min',
              iconColor: Colors.brown,
            ),
          ],
        )
      ],
    );
  }
}
