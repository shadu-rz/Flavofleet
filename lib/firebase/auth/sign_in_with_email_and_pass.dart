
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fleet_main/Widgets/Utils/show_custom_snackbar.dart';
import 'package:flavour_fleet_main/Pages/Home/home_page.dart';
import 'package:flutter/material.dart';

void signUserIn(context, String email, String password) async {
  if (email.isEmpty) {
    showCustomSnackBar('Type in your emai address',
        title: 'Email address', color: Colors.red);
  } else if (password.isEmpty) {
    showCustomSnackBar('Type in your password',
        title: 'Password', color: Colors.red);
  } 

  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  try {
   
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
     showCustomSnackBar(
      'All went well',
      title: 'perfect',
      color: Colors.green,
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context);
    print(e.code);
    if (e.code == 'user-not-found') {
      wrongMessage(context,'User not found');
    } else if (e.code == 'wrong-password') {
      wrongMessage(context,'wrong password');
    }if (e.code == 'invalid-email') {
      wrongMessage(context,'enter email properly');
    }
  }
  // catch (e) {
  // Navigator.pop(context);
  // if (e is PlatformException && e.message.contains('network_error')) {
  //   networkErrorMessage(context);
  // } else {
  //   // Handle other types of exceptions or unknown errors
  //   unknownErrorMessage(context);
  // }
}

void wrongMessage(context,String title) {
  showDialog(
    context: context,
    builder: (context) {
      return  AlertDialog(
        title: Text(title),
      );
    },
  );
}

