import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fleet_main/Pages/accounts/logout_page.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/account_widget.dart';
import 'package:flavour_fleet_main/Widgets/app_icon.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/small_text.dart';
import 'package:flavour_fleet_main/firebase/auth/usercontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

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
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              navigator!.pop();
            },
            icon:const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Center(
            child: BigText(
          text: 'Account',
          size: 24,
          color: Colors.black,
        )),
        backgroundColor: Colors.white,
      ),
      body: Stack(
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
                            backgroundColor: Colors.blueGrey[400],
                            backgroundImage: NetworkImage(snapshot
                                    .data!['image'].isEmpty
                                ? 'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659651_960_720.png'
                                : snapshot.data!['image']),
                            radius: Dimensions.height45 * 1.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10*5,
                      ),
                      
                      // GestureDetector(
                      //   onTap: () =>
                      //       Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const EditProfile(),
                      //   )),
                      //   child: Container(
                      //     margin: EdgeInsets.symmetric(
                      //         horizontal: Dimensions.height15 + 3),
                      //     decoration: BoxDecoration(
                      //         color: Colors.black12,
                      //         borderRadius:
                      //             BorderRadius.circular(Dimensions.radius15)),
                      //     height: Dimensions.height45 - 5,
                      //     width: double.maxFinite,
                      //     child: Center(child: BigText(text: 'update profile')),
                      //   ),
                      // ),
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
                            GestureDetector(
                              onTap: () {
                                _showMyDialog();
                              },
                              child: AccountWidget(
                                containColor: Colors.white60,
                                appIcon: AppIcon(
                                  icon: Icons.logout,
                                  backgroundColor: Colors.deepOrangeAccent,
                                  iconColor: Colors.white,
                                  size: Dimensions.height10 * 5,
                                  iconSize: Dimensions.height10 * 5 / 2,
                                ),
                                bigText: BigText(
                                  text: 'Logout',
                                  size: Dimensions.screenWidth / 20,
                                ),
                              ),
                            ),
                            const Spacer(),
                            SmallText(text: 'FlavorFleet   v1.0'),
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

  Future<void> _showMyDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Are you sure want to log out?',
              style: TextStyle(
                fontSize: Dimensions.font20 - 3,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Confirm'),
                onPressed: () {
                  navigator!.pushReplacement(MaterialPageRoute(
                    builder: (context) => const LogoutPage(),
                  ));
                  return signUserOut();
                },
              ),
            ],
          );
        });
  }
}
