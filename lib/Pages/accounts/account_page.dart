import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavofleet_main/Pages/settings/settings_page.dart';
import 'package:flavofleet_main/Utils/colors.dart';
import 'package:flavofleet_main/Utils/diamensions.dart';
import 'package:flavofleet_main/Widgets/account%20page%20widgets/account_widget.dart';
import 'package:flavofleet_main/Widgets/app_icon.dart';
import 'package:flavofleet_main/Utils/big_text.dart';
import 'package:flavofleet_main/Widgets/is_guest_mode.dart';
import 'package:flavofleet_main/Widgets/small_text.dart';
import 'package:flavofleet_main/firebase/auth/usercontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class AccountPage extends StatefulWidget {
  const AccountPage({super.key, required this.isGuest});
  final bool isGuest;

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final UserController userController = Get.find<UserController>();

  final isLoggedIn = true;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              navigator!.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Center(
          child: BigText(
            text: 'Account',
            size: 24,
            color: Colors.black,
          ),
        ),
        actions: [
          Visibility(
            visible: !widget.isGuest,
            child: IconButton(
              onPressed: () {
                navigator!.push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.settings,
              ),
            ),
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: widget.isGuest
          ? const IsGuestMode()
          : Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      // image: DecorationImage(
                      //   image: AssetImage('assets/image/food8.jpg'),
                      //   fit: BoxFit.cover,
                      // ),
                      ),
                  // color: Colors.amber,
                ),
                FutureBuilder(
                    future: firestore
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .get(),
                    builder: (context,
                        AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (snapshot.hasError) {
                        log("some error");
                      }

                      if (!snapshot.hasData) {
                        return const Center(
                          child: Text('No data'),
                        );
                      }

                      return Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(top: Dimensions.height20),
                        child: Column(
                          children: [
                            //profile icon
                            GestureDetector(
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: CircleAvatar(
                                        radius: Dimensions.height45 * 2,
                                        backgroundImage: NetworkImage(snapshot
                                                .data!['image'].isEmpty
                                            ? 'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659651_960_720.png'
                                            : snapshot.data!['image']),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: CircleAvatar(
                                radius: Dimensions.height45 * 1.6,
                                backgroundColor: Colors.white60,
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey[350],
                                  backgroundImage: NetworkImage(snapshot
                                          .data!['image'].isEmpty
                                      ? 'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659651_960_720.png'
                                      : snapshot.data!['image']),
                                  radius: Dimensions.height45 * 1.5,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height10 * 5,
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            //scrollable
                            Expanded(
                              child: Column(
                                children: [
                                  // name
                                  AccountWidget(
                                    containColor: Colors.white60,
                                    appIcon: AppIcon(
                                      icon: Icons.person,
                                      backgroundColor: AppColors.mainColor,
                                      iconColor: Colors.white,
                                      size: Dimensions.height10 * 5,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                    ),
                                    bigText: BigText(
                                      text:
                                          ' ${snapshot.data!['username'].isEmpty ? 'Guest' : snapshot.data!['username']}',
                                      size: Dimensions.screenWidth / 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  //phone
                                  AccountWidget(
                                    containColor: Colors.white60,
                                    appIcon: AppIcon(
                                      icon: Icons.phone,
                                      backgroundColor: Colors.amberAccent,
                                      iconColor: Colors.white,
                                      size: Dimensions.height10 * 5,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                    ),
                                    bigText: BigText(
                                      text:
                                          ' ${snapshot.data!['phoneNumber'].isNotEmpty ? snapshot.data!['phoneNumber'] : 'Number not available'}',
                                      size: Dimensions.screenWidth / 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  //email
                                  AccountWidget(
                                    containColor: Colors.white60,
                                    appIcon: AppIcon(
                                      icon: Icons.email,
                                      backgroundColor: Colors.brown,
                                      iconColor: Colors.white,
                                      size: Dimensions.height10 * 5,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                    ),
                                    bigText: BigText(
                                      text: snapshot.data!['email'].isEmpty
                                          ? 'Email not available '
                                          : snapshot.data!['email'],
                                      size: Dimensions.screenWidth / 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  //address
                                  AccountWidget(
                                    containColor: Colors.white60,
                                    appIcon: AppIcon(
                                      icon: Icons.location_on,
                                      backgroundColor: Colors.greenAccent,
                                      iconColor: Colors.white,
                                      size: Dimensions.height10 * 5,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                    ),
                                    bigText: BigText(
                                      text: 'Location not available',
                                      size: Dimensions.screenWidth / 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),

                                  //messages

                                  const Spacer(),
                                  SmallText(text: 'FlavoFleet   v1.0'),
                                  SizedBox(height: Dimensions.height20)
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ],
            ),
    );
  }

  getUserDetails() async {
    DocumentSnapshot snap = await firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return snap;
  }
}

