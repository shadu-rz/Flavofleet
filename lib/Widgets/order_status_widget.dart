import 'package:flavofleet_main/Widgets/Utils/colors.dart';
import 'package:flavofleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavofleet_main/Widgets/small_text.dart';
import 'package:flutter/material.dart';

class OrderStatusWidget extends StatelessWidget {
  final String title;
  final bool isChecked;
  const OrderStatusWidget({
    required this.title,
    super.key,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(width: Dimensions.width20+5),
        Column(
          children: [
            Container(
              height: 50,
              width: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: isChecked ? Colors.green : Colors.grey,
              ),
            ),
            CircleAvatar(
              radius: 7,
              backgroundColor: isChecked ? AppColors.mainColor : Colors.grey,
            ),
          ],
        ),
        // Checkbox(value: isChecked, onChanged: (value) {
        // },),
        SizedBox(width: Dimensions.width20),
        SmallText(
          text: title,
          color: AppColors.mainBlackColor,
          size: 17,
        )
      ],
    );
  }
}
