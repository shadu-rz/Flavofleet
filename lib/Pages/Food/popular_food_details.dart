
import 'package:flavour_fleet_main/Widgets/appbar_pop_food_details.dart';
import 'package:flavour_fleet_main/Widgets/body_pop_food_details.dart';
import 'package:flavour_fleet_main/Widgets/image_pop_food_details.dart';
import 'package:flavour_fleet_main/Widgets/navbar_pop_food_details.dart';
import 'package:flutter/material.dart';

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
            ImagePopFoodDetails(snap: snap),
            // Icon Widgets
            const AppbarPopFoodDetails(),
            // Indroduction of food
            BodyPopFoodDetails(snap: snap),
          ],
        ),
        // bottomNavigation Bar
        bottomNavigationBar: NavBarPopFoodDetails(snap: snap));
  }
}

