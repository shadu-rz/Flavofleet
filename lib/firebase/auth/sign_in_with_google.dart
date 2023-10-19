  import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavofleet_main/firebase/auth/usercontroller.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

final UserController userController = Get.find<UserController>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);

      final User? user = authResult.user;

      if (authResult.additionalUserInfo!.isNewUser) {
        await firestore.collection('users').doc(authResult.user!.uid).set({
          'username': authResult.user!.displayName,
          'email': authResult.user!.email,
          'image': authResult.user!.photoURL,
          'phoneNumber': authResult.user!.phoneNumber ?? "",
          'uId': authResult.user!.uid,
        });
      }

      return user;
    } catch (e) {
       log('Google Sign-In Errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr: $e');
      return null; 
    }
  }