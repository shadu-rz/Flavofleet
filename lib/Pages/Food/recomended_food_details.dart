import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/recommended%20food%20widgets/appbar_and_image_reco_food_details.dart';

import 'package:flavour_fleet_main/Widgets/expandable_text_widget.dart';
import 'package:flavour_fleet_main/Widgets/recommended%20food%20widgets/navbar_reco_food_details.dart';
import 'package:flavour_fleet_main/firebase/firebase_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecomendedFoodDetails extends StatelessWidget {
  const RecomendedFoodDetails({
    super.key,
    required this.snap,
  });
  final Map<String, dynamic> snap;

  @override
  Widget build(BuildContext context) {
    final FirebaseMethods firebase = Get.put(FirebaseMethods());
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      firebase.getSelectedProduct('recommendedProducts',snap['productId']);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // appbar and image
          AppbarAndImageRecoFoodDetails(snap: snap),

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
      // bottomNavigation Bar
      bottomNavigationBar: NavbarRecoFoodDetails(snap: snap),
    );
  }
}
