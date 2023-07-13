import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fleet_main/Widgets/show_custom_snackbar.dart';
import 'package:flavour_fleet_main/Pages/Home/home_page.dart';
import 'package:flavour_fleet_main/Pages/accounts/account_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future signUp(context, String email, String password) async {
  if (email.isEmpty) {
    showCustomSnackBar('Type in your emai address', title: 'Email address');
  } else if (password.isEmpty) {
    showCustomSnackBar('Type in your password', title: 'Password');
  }
   else if (password.length < 6) {
    showCustomSnackBar('Password cannot be less than six character',
        title: 'Password');
  }
  // else if (email.isEmail) {
  //   showCustomSnackBar('Provide a proper email address', title: 'Email');
  // }
   else {
    showCustomSnackBar('All went well', title: 'perfect');
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
    final UserCredential cred =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await firestore.collection('users').doc(cred.user!.uid).set({
      'email': email,
      'phoneNumber': '',
      'username': '',
      'image': '',
      'uId':cred.user!.uid
    });
    navigator!.pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context);
    if (e.code == 'user-not-found') {
      wrongEmailMessage(context);
    } else if (e.code == 'wrong-password') {
      wrongPasswordMessage(context);
    }
  }
}

void wrongEmailMessage(context) {
  showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        title: Text('Incorrect email'),
      );
    },
  );
}

void wrongPasswordMessage(context) {
  showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        title: Text('Incorrect email'),
      );
    },
  );
}
