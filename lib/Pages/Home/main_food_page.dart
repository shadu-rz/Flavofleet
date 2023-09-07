import 'package:flavour_fleet_main/Widgets/home%20page%20widgets/home_screen_appbar.dart';
import 'package:flutter/material.dart';

import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  final bool isGuest;

  const MainFoodPage({super.key, required this.isGuest});

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
            fit: BoxFit.cover,
          ),
        ),
        child:  Column(
          children: [
            SafeArea(
              //showing the header
              child: HomeScreenAppBar(isGuest: widget.isGuest,),
            ),
            //showing the body
            Expanded(
                child: SingleChildScrollView(
              child: FoodPageBody(isGuest: widget.isGuest,),
            ))
          ],
        ),
      ),
    );
  }
}
