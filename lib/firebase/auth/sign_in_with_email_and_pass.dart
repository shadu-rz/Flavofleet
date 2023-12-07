import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavofleet_main/Utils/show_custom_snackbar.dart';
import 'package:flavofleet_main/Pages/Home/home_page.dart';
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
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const HomePage(
          isGuest: false,
        ),
      ),
      (router) => false,
    );
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context);
    
    if (e.code == 'user-not-found') {
      wrongMessage(context, 'User not found');
    } else if (e.code == 'wrong-password') {
      wrongMessage(context, 'wrong password');
    }
    if (e.code == 'invalid-email') {
      wrongMessage(context, 'enter email properly');
    }
  }
}

void wrongMessage(context, String title) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
      );
    },
  );
}
