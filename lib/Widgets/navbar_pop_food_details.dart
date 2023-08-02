import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fleet_main/Pages/address/select_address.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/show_custom_snackbar.dart';
import 'package:flavour_fleet_main/controller/cart_controller.dart';
import 'package:flavour_fleet_main/firebase/firebase_methods.dart';
import 'package:flavour_fleet_main/model/cart_model.dart';
import 'package:flavour_fleet_main/model/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class NavBarPopFoodDetails extends StatefulWidget {
  const NavBarPopFoodDetails({
    super.key,
    required this.snap,
  });

  final Map<String, dynamic> snap;

  @override
  State<NavBarPopFoodDetails> createState() => _NavBarPopFoodDetailsState();
}

class _NavBarPopFoodDetailsState extends State<NavBarPopFoodDetails> {
  final FirebaseMethods firebase = Get.put(FirebaseMethods());

  final CartController countController = Get.find();

  @override
  void dispose() {
    countController.count = RxInt(1);
    super.dispose();
  }

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
          GestureDetector(
            onTap: () async {
              if (await FirebaseMethods().alreadyExistInFavorite(
                  FirebaseAuth.instance.currentUser!.uid,
                  widget.snap['title'])) {
                showCustomSnackBar(
                  'Already exist in the favorites',
                  title: 'Existing',
                  color: Colors.red,
                );
              } else {
                String id = const Uuid().v1();
                FavoriteModel product = FavoriteModel(
                  title: widget.snap['title'],
                  price: double.parse(widget.snap['price']),
                  image: widget.snap['image'],
                  description: widget.snap['description'],
                  distance: double.parse(widget.snap['distance']),
                  rating: double.parse(widget.snap['rating']),
                  star: double.parse(widget.snap['star']),
                  uId: FirebaseAuth.instance.currentUser!.uid,
                  productId: id,
                );
                await FirebaseMethods().addToFav(product);
                log('favoriteeeeeeee');
              }
            },
            child: Container(
              padding: EdgeInsets.only(
                top: Dimensions.height10,
                bottom: Dimensions.height10,
                right: Dimensions.width20 / 2,
                left: Dimensions.width20 / 2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: Colors.white,
              ),
              child: Icon(
                Icons.favorite_border_outlined,
                color: AppColors.mainColor,
                size: Dimensions.iconSize24,
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (await FirebaseMethods().alreadyExistInCart(
                  FirebaseAuth.instance.currentUser!.uid,
                  widget.snap['title'])) {
                showCustomSnackBar(
                  'Already exist in the cart',
                  title: 'Existing',
                  color: Colors.red,
                );
              } else {
                String id = const Uuid().v1();
                CartModel product = CartModel(
                    title: widget.snap['title'],
                    price: double.parse(widget.snap['price']),
                    image: widget.snap['image'],
                    description: widget.snap['description'],
                    distance: double.parse(widget.snap['distance']),
                    rating: double.parse(widget.snap['rating']),
                    star: double.parse(widget.snap['star']),
                    uId: FirebaseAuth.instance.currentUser!.uid,
                    productId: id,
                    itemCount: countController.count.value);
                await FirebaseMethods().addToCart(product);
                firebase.getCartDetails();
              }
            },
            child: Container(
              height: Dimensions.height45,
              width: Dimensions.height45 * 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BigText(
                      text: "Add to cart",
                      color: Colors.white,
                      size: Dimensions.font20 / 1.2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              navigator!.push(MaterialPageRoute(
                builder: (context) => SelectAddress(
                  isCart: false,
                  productSnap: widget.snap,
                ),
              ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: BigText(
                  text: "Buy Now",
                  color: Colors.white,
                  size: Dimensions.font20 / 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
