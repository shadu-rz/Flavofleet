import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fleet_main/Pages/address/select_address.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/app_icon.dart';
import 'package:flavour_fleet_main/Widgets/Utils/big_text.dart';
import 'package:flavour_fleet_main/Widgets/no_internet.dart';
import 'package:flavour_fleet_main/controller/cart_controller.dart';
import 'package:flavour_fleet_main/firebase/firebase_methods.dart';
import 'package:flavour_fleet_main/model/cart_model.dart';
import 'package:flavour_fleet_main/model/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class NavbarRecoFoodDetails extends StatefulWidget {
  final bool isGuest;
  const NavbarRecoFoodDetails(
      {super.key, required this.snap, required this.isGuest});
  final Map<String, dynamic> snap;

  @override
  State<NavbarRecoFoodDetails> createState() => _NavbarRecoFoodDetailsState();
}

class _NavbarRecoFoodDetailsState extends State<NavbarRecoFoodDetails> {
  final FirebaseMethods firebase = Get.put(FirebaseMethods());

  final CartController countController = Get.find();

  @override
  @override
  void dispose() {
    countController.count = RxInt(1);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          // color: Colors.red,
          padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width10,
                  vertical: Dimensions.width10 / 2,
                ),
                child: BigText(
                  text: "₹ ${widget.snap['price']}",
                  color: const Color.fromARGB(255, 0, 0, 0),
                  size: Dimensions.font26,
                ),
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
              // color: Colors.amber,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () async {
                  bool isConnected =
                      await NoInternetWidget.checkInternetConnectivity();
                  if (isConnected) {
                    if (await FirebaseMethods().alreadyExistInFavorite(
                        FirebaseAuth.instance.currentUser!.uid,
                        widget.snap['title'])) {
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
                  } else {
                    NoInternetWidget.noInternetConnection(context);
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
                      color: const Color.fromRGBO(255, 255, 255, 1)),
                  child: AppIcon(
                    icon: Icons.favorite_border, // fav icon
                    iconColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                    size: Dimensions.iconSize24,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  bool isConnected =
                      await NoInternetWidget.checkInternetConnectivity();
                  if (isConnected) {
                    if (await FirebaseMethods().alreadyExistInCart(
                      FirebaseAuth.instance.currentUser!.uid,
                      widget.snap['title'],
                    )) {
                      // showCustomSnackBar('Already exist in the cart',
                      //     title: 'Existing', color: Colors.red);
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
                  } else {
                    NoInternetWidget.noInternetConnection(context);
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width10,
                  ),
                  height: Dimensions.height45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    color: AppColors.mainColor,
                  ),
                  child: Center(
                    child: BigText(
                      text: "add to cart",
                      color: Colors.white,
                      size: Dimensions.font20 / 1.1,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  bool isConnected =
                      await NoInternetWidget.checkInternetConnectivity();
                  if (isConnected) {
                    navigator!.push(MaterialPageRoute(
                      builder: (context) => SelectAddress(
                        isGuest: widget.isGuest,
                        isCart: false,
                        productSnap: widget.snap,
                      ),
                    ));
                  } else {
                    NoInternetWidget.noInternetConnection(context);
                  }
                },
                child: Container(
                  height: Dimensions.height45,
                  width: Dimensions.height10 * 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    color: AppColors.mainColor,
                  ),
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
