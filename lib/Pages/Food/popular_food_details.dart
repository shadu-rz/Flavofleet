
import 'package:flavour_fleet_main/Widgets/appbar_pop_food_details.dart';
import 'package:flavour_fleet_main/Widgets/body_pop_food_details.dart';
import 'package:flavour_fleet_main/Widgets/image_pop_food_details.dart';
import 'package:flavour_fleet_main/Widgets/navbar_pop_food_details.dart';
import 'package:flavour_fleet_main/firebase/firebase_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularFoodDetails extends StatelessWidget {
  
  
  const PopularFoodDetails({
    super.key,
    required this.snap,
  });
  final Map<String, dynamic> snap;
  @override
  Widget build(BuildContext context) {
     final FirebaseMethods firebase = Get.put(FirebaseMethods());
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      firebase.getSelectedProduct('popularProducts',snap['productId']);
    });
    return Scaffold(
        body: Stack(
          children: [
            //background Image
            ImagePopFoodDetails(snap: snap),
            // Icon Widgets
            const AppbarPopFoodDetails( ),
            // Indroduction of food
            BodyPopFoodDetails(snap: snap),
          ],
        ),
        // bottomNavigation Bar
        bottomNavigationBar: NavBarPopFoodDetails(snap: snap));
  }
}

