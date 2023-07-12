import 'package:flavour_fleet_main/Pages/favorite/favorite.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/food8.jpg"),
                // image: NetworkImage('https://img.freepik.com/free-photo/top-view-box-with-salad-coffee-cup_23-2148247940.jpg?w=1060&t=st=1687517413~exp=1687518013~hmac=1e9fa83b70d1ed4ff66ea2b63f353941410f879c619d488657c7dbb935da1e99'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            SafeArea(
              //showing the header
              child: Container(
                child: Container(
                  margin: EdgeInsets.only(
                      top: Dimensions.height15, bottom: Dimensions.height15),
                  padding: EdgeInsets.only(
                      left: Dimensions.width15, right: Dimensions.width15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => navigator!.push(
                          MaterialPageRoute(
                            builder: (context) => const FavoritePage(),
                          ),
                        ),
                        child: Container(
                          height: Dimensions.screenWidth / 10,
                          width: Dimensions.screenWidth / 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.mainColor),
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          BigText(
                            text: 'India',
                            color: Colors.white,
                            size: 30,
                            fontWeight: FontWeight.w800,
                          ),
                          Row(
                            children: [
                              SmallText(
                                size: 15,
                                text: 'Malappuram',
                                color: Colors.white,
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          width: Dimensions.screenWidth / 10,
                          height: Dimensions.screenWidth / 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.mainColor,
                          ),
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //showing the body
            const Expanded(
                child: SingleChildScrollView(
              // physics: NeverScrollableScrollPhysics(),
              child: FoodPageBody(),
            ))
          ],
        ),
      ),
    );
  }
}
