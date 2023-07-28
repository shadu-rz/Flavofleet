import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fleet_main/Pages/accounts/account_page.dart';
import 'package:flavour_fleet_main/Pages/favorite/favorite.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: Dimensions.height15, bottom: Dimensions.height15),
      padding:
          EdgeInsets.only(left: Dimensions.width15, right: Dimensions.width15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => navigator!.push(
              MaterialPageRoute(
                builder: (context) => const FavoritePage(),
              ),
            ),
            child: Container(
              height: Dimensions.screenWidth / 10,
              width: Dimensions.screenWidth / 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black),  //change color to main color
              child: const Icon(
                Icons.favorite,
                color: Colors.black, //change color to main color
              ),
            ),
          ),
          Column(
            children: [
              BigText(
                text: 'India',
                color: Colors.white,
                size: 30,
                fontWeight: FontWeight.w800,
              ),
              Row(
                children: [
                  SmallText(
                    size: 15,
                    text: 'Malappuram',
                    color: Colors.white,
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  )
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              navigator!.push(MaterialPageRoute(
                builder: (context) => const AccountPage(),
              ));
            },
            child: Center(
              child: FutureBuilder(
                  future: FirebaseFirestore.instance
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

                    if (!snapshot.hasData) {
                      return const CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659651_960_720.png',
                        ),
                      );
                    }

                    return CircleAvatar(
                      radius: 24,
                      child: CircleAvatar(
                        backgroundColor: AppColors.mainColor,
                        radius: 22,
                        backgroundImage: NetworkImage(
                          snapshot.data!['image'].isEmpty
                              ? 'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659651_960_720.png'
                              : snapshot.data!['image'],
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
