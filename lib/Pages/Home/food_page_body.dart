import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/home_page_hor_slide_widget.dart';
import 'package:flavour_fleet_main/Widgets/recommended_list_home_page.dart';
import 'package:flavour_fleet_main/Widgets/recommended_title_widget.dart';
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
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          //Slider Section
          HomePageHorSlideWidget(pageController: pageController),

          SizedBox(height: Dimensions.height10),

          //Recommended title widget
          const RecommedeTitleWidget(),

          SizedBox(height: Dimensions.height10),

          //recomended food list of food and images
          const RecommendedProductListWidget()
        ],
      ),
    );
  }
}
