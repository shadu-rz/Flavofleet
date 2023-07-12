import 'package:firebase_core/firebase_core.dart';
import 'package:flavour_fleet_main/Controllers/popular_product_controller.dart';
import 'package:flavour_fleet_main/Controllers/recommended_product_controller.dart';
import 'package:flavour_fleet_main/firebase/usercontroller.dart';
import 'package:flavour_fleet_main/Pages/Splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dep.init();
  Get.put(UserController()); 
  runApp(const MyApp());  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getrecommendedProductList();

    return  GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:  const SpalshScreen(),
    );
  }
}
