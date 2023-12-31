import 'package:firebase_core/firebase_core.dart';
import 'package:flavofleet_main/controller/cart_controller.dart';
import 'package:flavofleet_main/firebase/auth/usercontroller.dart';
import 'package:flavofleet_main/Pages/Splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:flavofleet_main/.env';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(UserController());
  Get.put(CartController());
  Stripe.publishableKey = stripePublishableKey;
  await Stripe.instance.applySettings();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const SpalshScreen(),
    );
  }
}
