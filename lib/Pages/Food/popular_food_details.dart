
import 'package:flavour_fleet_main/Pages/Cart/cart_page.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/app_column.dart';
import 'package:flavour_fleet_main/Widgets/app_icon.dart';
import 'package:flavour_fleet_main/Widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widgets/big_text.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({
    super.key,
    required this.snap,
  });
  final Map<String, dynamic> snap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            //background Image
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.populaFoodImageSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(snap['image']),
                  ),
                ),
              ),
            ),
            // Icon Widgets
            Positioned(
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
                      backgroundColor: const Color.fromARGB(150, 200, 200, 200),
                      size: Dimensions.height45,
                      iconSize: Dimensions.height20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => navigator!.push(
                      MaterialPageRoute(
                        builder: (context) => const CartPage(),
                      ),
                    ),
                    child: AppIcon(
                      icon: Icons.shopping_cart_outlined,
                      backgroundColor: const Color.fromARGB(150, 200, 200, 200),
                      size: Dimensions.height45,
                      iconSize: Dimensions.height20,
                    ),
                  ),
                ],
              ),
            ),
            // Indroduction of food
            Positioned(
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
                    AppColumn(
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
            ),
          ],
        ),
        // bottomNavigation Bar
        bottomNavigationBar: Container(
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
                height: Dimensions.height45,
                width: Dimensions.height10 * 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.remove,
                      color: Colors.grey,
                    ),
                    BigText(text: '20'),
                    const Icon(
                      Icons.add,
                      color: Colors.grey,
                    )
                  ],
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
                    child: BigText(
                      text: "₹${snap['price'].toString()} add to cart",
                      // text: snap['price'].toString(),
                      color: Colors.white,
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
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
