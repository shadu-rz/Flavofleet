import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/show_custom_snackbar.dart';
import 'package:flavour_fleet_main/firebase/firebase_methods.dart';
import 'package:flavour_fleet_main/model/popular_product_model.dart';
import 'package:flutter/material.dart';

class NavBarPopFoodDetails extends StatelessWidget {
  const NavBarPopFoodDetails({
    super.key,
    required this.snap,
  });

  final Map<String, dynamic> snap;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                BigText(
                  text: '20',
                  size: Dimensions.font20,
                ),
                const Icon(
                  Icons.add,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          GestureDetector(

            onTap: () async {
               if (await FirebaseMethods().alreadyExistInCart(FirebaseAuth.instance.currentUser!.uid, snap['title'])) {
                showCustomSnackBar('Already exist in the cart',title: '');
              }else{
                 PopularProductModel product = PopularProductModel(
                title: snap['title'],
                price: double.parse(snap['price']) ,
                image: snap['image'],
                description: snap['description'],
                distance: double.parse(snap['distance']) ,
                rating: double.parse(snap['rating'])  ,
                star: double.parse(snap['star']) ,
                time: double.parse(snap['time']) ,
                uId: FirebaseAuth.instance.currentUser!.uid,
              );
              await FirebaseMethods().addToCartPopular(product);
              }
            },
            child: Container(
              height: Dimensions.height45,
              width: Dimensions.height10 * 17,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: AppColors.mainColor,
              ),
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
                      size: Dimensions.font20 / 1.1,
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
    );
  }
}
