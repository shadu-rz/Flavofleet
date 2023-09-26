import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fleet_main/Pages/Cart/cart_page.dart';
import 'package:flavour_fleet_main/Pages/accounts/account_page.dart';
import 'package:flavour_fleet_main/Pages/favorite/favorite.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/Utils/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenAppBar extends StatelessWidget {
  final bool isGuest;
  const HomeScreenAppBar({
    required this.isGuest,
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
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: Dimensions.width10),
          GestureDetector(
            onTap: () => navigator!.push(
              MaterialPageRoute(
                builder: (context) => FavoritePage(
                  isGuest: isGuest,
                ),
              ),
            ),
            child: Container(
              height: Dimensions.screenWidth / 12,
              width: Dimensions.screenWidth / 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.mainWithLowOpacity,
              ), //change color to main color
              child: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          SizedBox(width: Dimensions.width10 + 2),
          GestureDetector(
            onTap: () => navigator!.push(
              MaterialPageRoute(
                builder: (context) => CartPage(isGuest: isGuest),
              ),
            ),
            child: Container(
              height: Dimensions.screenWidth / 12,
              width: Dimensions.screenWidth / 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.mainWithLowOpacity,
              ),
              child: const Icon(
                Icons.shopping_cart,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: Dimensions.width20 + 15),
          BigText(
            text: 'Flavour Fleet',
            color: Colors.white,
            size: 22,
            fontWeight: FontWeight.w800,
          ),
          SizedBox(width: Dimensions.width20 * 2),
          GestureDetector(
            onTap: () {
              navigator!.push(MaterialPageRoute(
                builder: (context) => AccountPage(isGuest: isGuest),
              ));
            },
            child: Center(
              child: FirebaseAuth.instance.currentUser == null
                  ? const CircleAvatar(
                      backgroundColor: AppColors.mainColor,
                      radius: 20,
                      backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659651_960_720.png',
                      ),
                    )
                  : FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .get(),
                      builder: (context,
                          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                              snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                          backgroundColor: AppColors.mainColor,
                          radius: 20,
                          child: CircleAvatar(
                            backgroundColor: AppColors.mainColor,
                            radius: 18,
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
