import 'package:flavour_fleet_main/Widgets/home_screen_appbar.dart';
import 'package:flutter/material.dart';

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
                fit: BoxFit.cover)),
        child: const Column(
          children: [
            SafeArea( 
              //showing the header
              child: HomeScreenAppBar(),
            ),
            //showing the body
             Expanded(
                child: SingleChildScrollView(
              child: FoodPageBody(),
            ))
          ],
        ),
      ),
    );
  }
}

