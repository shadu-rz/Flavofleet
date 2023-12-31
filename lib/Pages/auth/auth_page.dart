import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavofleet_main/Pages/Home/home_page.dart';
import 'package:flavofleet_main/Pages/auth/login_page.dart';
import 'package:flutter/material.dart';

//this widget is to decide wheather it is logged in or not

class AuthPage extends StatelessWidget {
   const AuthPage({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  const HomePage(isGuest: false,);
          }else{
            return const SignInPage();
          }
        },
      ),
    );
  }
}