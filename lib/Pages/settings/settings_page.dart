import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavofleet_main/Pages/auth/login_page.dart';
import 'package:flavofleet_main/Pages/settings/about%20us/about_us.dart';
import 'package:flavofleet_main/Pages/settings/privacy%20policy/privacy_policy.dart';
import 'package:flavofleet_main/Pages/settings/terms%20and%20conditions/terms_and_conditions.dart';
import 'package:flavofleet_main/Widgets/Utils/colors.dart';
import 'package:flavofleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavofleet_main/Widgets/Utils/big_text.dart';
import 'package:flavofleet_main/Widgets/no_internet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BigText(text: 'Settings'),
      ),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(
              left: Dimensions.height20,
              right: Dimensions.height20,
              top: Dimensions.height20,
            ),
            padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius15),
              border: Border.all(
                width: 1,
                color: AppColors.mainColor,
              ),
            ),
            child: Center(
              child: BigText(
                text: 'Edit profile',
                size: 18,
                color: const Color.fromARGB(255, 59, 105, 102),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              navigator!.push(MaterialPageRoute(
                builder: (context) => const PrivacyPolicyPage(),
              ));
            },
            child: Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(
                left: Dimensions.height20,
                right: Dimensions.height20,
                top: Dimensions.height20,
              ),
              padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                border: Border.all(
                  width: 1,
                  color: AppColors.mainColor,
                ),
              ),
              child: Center(
                child: BigText(
                  text: 'Privacy and policy',
                  size: 18,
                  color: const Color.fromARGB(255, 59, 105, 102),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              navigator!.push(MaterialPageRoute(
                builder: (context) => const TermsAndConditionsPage(),
              ));
            },
            child: Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(
                left: Dimensions.height20,
                right: Dimensions.height20,
                top: Dimensions.height20,
              ),
              padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                border: Border.all(
                  width: 1,
                  color: AppColors.mainColor,
                ),
              ),
              child: Center(
                child: BigText(
                  text: 'Terms and conditions',
                  size: 18,
                  color: const Color.fromARGB(255, 59, 105, 102),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              navigator!.push(MaterialPageRoute(
                builder: (context) => const AboutUsPage(),
              ));
            },
            child: Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(
                left: Dimensions.height20,
                right: Dimensions.height20,
                top: Dimensions.height20,
              ),
              padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                border: Border.all(
                  width: 1,
                  color: AppColors.mainColor,
                ),
              ),
              child: Center(
                child: BigText(
                  text: 'About us',
                  size: 18,
                  color: const Color.fromARGB(255, 59, 105, 102),
                ),
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              _showMyDialog(context);
            },
            child: Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(
                left: Dimensions.height20,
                right: Dimensions.height20,
                top: Dimensions.height20,
                bottom: Dimensions.height20,
              ),
              padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                border: Border.all(
                  width: 1,
                  color: Colors.red,
                ),
              ),
              child: Center(
                child: BigText(
                  text: 'Logout',
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _showMyDialog(context) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Are you sure want to log out?',
            style: TextStyle(
              fontSize: Dimensions.font20 - 3,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () async {
                bool isConnected =
                    await NoInternetWidget.checkInternetConnectivity();
                if (isConnected) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const SignInPage(),
                    ),
                    ModalRoute.withName('/'),
                  );
                  return signUserOut();
                } else {
                  NoInternetWidget.noInternetConnection(context);
                }
              },
            ),
          ],
        );
      });
}

void signUserOut() async {
  try {
    await FirebaseAuth.instance.signOut();
  } catch (e) {
    log("Sign out error occured: $e");
  }
}
