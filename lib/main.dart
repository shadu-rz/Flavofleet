import 'package:firebase_core/firebase_core.dart';
import 'package:flavour_fleet_main/firebase/usercontroller.dart';
import 'package:flavour_fleet_main/Pages/Splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(UserController()); 
  runApp(const MyApp());  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
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
