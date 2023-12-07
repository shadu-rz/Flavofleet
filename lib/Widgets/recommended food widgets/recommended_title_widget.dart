import 'dart:ui';

import 'package:flavofleet_main/Utils/diamensions.dart';
import 'package:flavofleet_main/Utils/big_text.dart';
import 'package:flavofleet_main/Widgets/small_text.dart';
import 'package:flutter/material.dart';

class RecommedeTitleWidget extends StatelessWidget {
  const RecommedeTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          height: Dimensions.height30,
          color: const Color.fromARGB(100, 184, 184, 184),
          // margin: EdgeInsets.only(left: Dimensions.width20),
          padding: EdgeInsets.only(
            left: Dimensions.width20,
            bottom: Dimensions.height10 / 2,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(
                text: 'Recomended',
                color: Colors.white,
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              SmallText(
                text: 'Food Pairing',
                color: Colors.white70,
                size: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

