
import 'package:flavour_fleet_main/Pages/Cart/cart_page.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/app_icon.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecomendedFoodDetails extends StatelessWidget {
  const RecomendedFoodDetails({super.key,  required this.snap});
  final Map<String,dynamic>snap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                      builder: (context) => const CartPage(),
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
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height10,
                  top: Dimensions.height10,
                ),
                child: ExpandableTextWidget(text: snap['description']),
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width20 * 2.5,
                right: Dimensions.width20 * 2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
                BigText(
                  text: '\₹${snap['price']} ' "X " '0',
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                const AppIcon(
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                    right: Dimensions.width20 / 2,
                    left: Dimensions.width20 / 2,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: Colors.white),
                  child: AppIcon(
                    icon: Icons.favorite,
                    iconColor: AppColors.mainColor,
                    size: Dimensions.iconSize24,
                  ),
                ),
                Container(
                  height: Dimensions.height45,
                  width: Dimensions.height10 * 17,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    color: AppColors.mainColor,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BigText(
                            text: "₹${snap['price']}",
                            color: Colors.white,
                          ),
                          BigText(
                            text: "add to cart",
                            color: Colors.white,
                            size: Dimensions.font20/1.1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: Dimensions.height45,
                  width: Dimensions.height10 * 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    color: AppColors.mainColor,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: BigText(
                        text: "Buy Now",
                        color: Colors.white,
                        size: Dimensions.font20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
