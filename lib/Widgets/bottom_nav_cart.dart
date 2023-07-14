import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flutter/material.dart';

class BottomNavCart extends StatelessWidget {
  const BottomNavCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: double.minPositive,
        child: Container(
          height: Dimensions.height10 * 6,
          width: Dimensions.screenWidth,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: Dimensions.height20 * 2,
                width: Dimensions.height45 * 2.7,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius15)),
                child: Center(
                  child: BigText(text: 'Total item: 6',size: Dimensions.font20/1.2,),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: Dimensions.height20 * 2,
                width: Dimensions.height45 * 2,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius15)),
                child: Center(
                  child: BigText(text: '₹ 360'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: Dimensions.height20 * 2,
                width: Dimensions.height45 * 3,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius15)),
                child: Center(
                  child: BigText(text: 'Check Out'),
                ),
              ),
            ],
          ),
        ));
  }
}

