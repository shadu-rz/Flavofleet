import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fleet_main/Widgets/Utils/show_custom_snackbar.dart';
import 'package:flavour_fleet_main/Pages/Home/home_page.dart';
import 'package:flavour_fleet_main/Pages/accounts/account_page.dart';
import 'package:flutter/material.dart';

Future signUp(context, String email, String password,String name) async {
  if (email.isEmpty) {
    showCustomSnackBar('Type in your emai address', title: 'Email address');
  } else if (password.isEmpty) {
    showCustomSnackBar('Type in your password', title: 'Password');
  }else if (name.isEmpty) {
    showCustomSnackBar('Enter your name', title: 'Name');
  }
   else if (password.length < 6) {
    showCustomSnackBar('Password cannot be less than six character',
        title: 'Password');
  }
  // else if (email.isEmail) {
  //   showCustomSnackBar('Provide a proper email address', title: 'Email');
  // }
   

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
      showCustomSnackBar('All went well', title: 'perfect');
    await firestore.collection('users').doc(cred.user!.uid).set({
      'email': email,
      'phoneNumber': '',
      'username': name,
      'image': '',
      'uId':cred.user!.uid
    });
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
