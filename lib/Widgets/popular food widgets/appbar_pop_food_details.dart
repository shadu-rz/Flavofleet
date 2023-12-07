import 'package:flavofleet_main/Pages/Cart/cart_page.dart';
import 'package:flavofleet_main/Utils/diamensions.dart';
import 'package:flavofleet_main/Widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarPopFoodDetails extends StatelessWidget {
  final bool isGuest;
  const AppbarPopFoodDetails({
    super.key,
     required this.isGuest
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: Dimensions.width20,
      right: Dimensions.width20,
      top: (Dimensions.height30 * 2) + 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => navigator!.pop(),
            child: AppIcon(
              icon: Icons.arrow_back,
              backgroundColor:Colors.white70,
              size: Dimensions.height45,
              iconSize: Dimensions.height20,
              iconColor: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: () => navigator!.push(
              MaterialPageRoute(
                builder: (context) =>  CartPage( isGuest: isGuest,),
              ),
            ),
            child: AppIcon(
              icon: Icons.shopping_cart_outlined,
              backgroundColor: Colors.white70,
              size: Dimensions.height45,
              iconSize: Dimensions.height20,
              iconColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

