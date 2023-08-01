import 'package:flavour_fleet_main/Pages/auth/sign_in_page.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
           SizedBox(height: Dimensions.height45*4),
          Container(
            height: Dimensions.height45 * 7,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/login_image.jpg"),
              ),
            ),
          ),
          SizedBox(height: Dimensions.height20*5),
          GestureDetector(
            onTap: () => navigator!.pushReplacement(
              MaterialPageRoute(
                builder: (context) => const SignInPage(),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(
                left: Dimensions.width10,
                right: Dimensions.width10,
              ),
              width: double.maxFinite,
              height: Dimensions.screenHeight / 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: BigText(
                  text: 'Sign in to your account',
                  size: Dimensions.font20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
