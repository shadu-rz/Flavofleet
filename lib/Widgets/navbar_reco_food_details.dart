import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fleet_main/Pages/checkout/checkout_page.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/app_icon.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/show_custom_snackbar.dart';
import 'package:flavour_fleet_main/firebase/firebase_methods.dart';
import 'package:flavour_fleet_main/model/recommended_product_mode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class NavbarRecoFoodDetails extends StatelessWidget {
  final FirebaseMethods firebase = Get.put(FirebaseMethods());
   NavbarRecoFoodDetails({
    super.key,
    required this.snap,
  });

  final Map<String, dynamic> snap;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                text: '₹${snap['price']} ' "X " '1',
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
              GestureDetector(
                onTap: ()async {
                  if (await FirebaseMethods().alreadyExistInCart(FirebaseAuth.instance.currentUser!.uid, snap['title'])) {
                showCustomSnackBar('Already exist in the cart',title: 'Existing',color: Colors.red);
              }else{
                 String id = const Uuid().v1();
                 RecommendedProductModel product = RecommendedProductModel(
                title: snap['title'],
                price: double.parse(snap['price']) ,
                image: snap['image'],
                description: snap['description'],
                distance: double.parse(snap['distance']) ,
                rating: double.parse(snap['rating'])  ,
                star: double.parse(snap['star']) ,
                uId: FirebaseAuth.instance.currentUser!.uid,
                productId: id,
              );
              await FirebaseMethods().addToCartRecommended(product);
              firebase.getCartDetails();
              }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    color: AppColors.mainColor,
                  ),
                  child: Center(
                    child: BigText(
                      text: "add to cart",
                      color: Colors.white,
                      size: Dimensions.font20/1.1,
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
                  onTap: () {
                     navigator!.push(MaterialPageRoute(builder: (context) =>  CheckoutPage(),));
                  },
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
    );
  }
}

