import 'package:flavofleet_main/Pages/Cart/cart_page.dart';
import 'package:flavofleet_main/Utils/colors.dart';
import 'package:flavofleet_main/Utils/diamensions.dart';
import 'package:flavofleet_main/Widgets/app_icon.dart';
import 'package:flavofleet_main/Utils/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarAndImageRecoFoodDetails extends StatelessWidget {
  final bool isGuest;
  const AppbarAndImageRecoFoodDetails({
    super.key,
    required this.snap,
    required this.isGuest
  });

  final Map<String, dynamic> snap;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 70,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              navigator!.pop();
            },
            child: const AppIcon(
              icon: Icons.clear,
              backgroundColor: Colors.white70,
            ),
          ),
          GestureDetector(
            onTap: () => navigator!.push(
              MaterialPageRoute(
                builder: (context) =>  CartPage(isGuest: isGuest),
              ),
            ),
            child: const AppIcon(
              icon: Icons.shopping_cart,
              backgroundColor: Colors.white70,
            ),
          )
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: Container(
          // margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),

          width: double.maxFinite,
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20))),
          child: Center(child: BigText(text: snap['title'])),
        ),
      ),
      pinned: true,
      backgroundColor: AppColors.mainColor,
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          snap['image'],
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
