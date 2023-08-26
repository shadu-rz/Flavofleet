import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/home%20page%20widgets/home_page_hor_slide_widget.dart';
import 'package:flavour_fleet_main/Widgets/recommended%20food%20widgets/recommended_list_home_page.dart';
import 'package:flavour_fleet_main/Widgets/recommended%20food%20widgets/recommended_title_widget.dart';
import 'package:flavour_fleet_main/firebase/firebase_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

 @override
  Widget build(BuildContext context) {
    final FirebaseMethods firebase = Get.put(FirebaseMethods());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      firebase.getCartDetails();
    });

    return SingleChildScrollView(
      child: Column(
        children: [
          //Slider Section
          HomePageHorSlideWidget(pageController: pageController),

          SizedBox(height: Dimensions.height10),

          //Recommended title widget
          const RecommedeTitleWidget(),

          SizedBox(height: Dimensions.height10),

          // Wrap the RecommendedProductListWidget with a Container and a SingleChildScrollView
          const SizedBox(
             height: 500,
             child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: RecommendedProductListWidget(),
            )// Set your desired height here,
           
          ),
        ],
      ),
    );
  }
}
