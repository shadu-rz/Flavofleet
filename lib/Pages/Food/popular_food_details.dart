import 'package:flavour_fleet_main/Widgets/popular%20food%20widgets/appbar_pop_food_details.dart';
import 'package:flavour_fleet_main/Widgets/popular%20food%20widgets/body_pop_food_details.dart';
import 'package:flavour_fleet_main/Widgets/popular%20food%20widgets/image_pop_food_details.dart';
import 'package:flavour_fleet_main/Widgets/popular%20food%20widgets/navbar_pop_food_details.dart';
import 'package:flavour_fleet_main/firebase/firebase_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularFoodDetails extends StatelessWidget {
  final bool isGuest;

  const PopularFoodDetails(
      {super.key, required this.snap, required this.isGuest});
  final Map<String, dynamic> snap;
  @override
  Widget build(BuildContext context) {
    final FirebaseMethods firebase = Get.put(FirebaseMethods());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      firebase.getSelectedProduct('popularProducts', snap['productId']);
    });
    return Scaffold(
        body: Stack(
          children: [
            //background Image
            ImagePopFoodDetails(snap: snap),
            // Icon Widgets
            AppbarPopFoodDetails(
              isGuest: isGuest,
            ),
            // Indroduction of food
            BodyPopFoodDetails(snap: snap),
          ],
        ),
        // bottomNavigation Bar
        bottomNavigationBar: NavBarPopFoodDetails(
          snap: snap,
          isGuest: isGuest,
        ));
  }
}
