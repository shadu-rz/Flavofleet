import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/bottom_nav_cart.dart';
import 'package:flavour_fleet_main/Widgets/cart_list_widget.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final int totalItemInCart = 10;
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        title: BigText(text: 'Cart',color: Colors.white),
      ),
      body: Stack(
        children: [
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height10,
            bottom: 0,
            child: SizedBox(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: const CartListWidget(),
              ),
            ),
          ),
          const BottomNavCart()
        ],
      ),
    );
  }
}

