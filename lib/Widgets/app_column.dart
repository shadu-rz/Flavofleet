import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fleet_main/Widgets/show_custom_snackbar.dart';
import 'package:flavour_fleet_main/Widgets/small_text.dart';
import 'package:flavour_fleet_main/firebase/firebase_methods.dart';
import 'package:flavour_fleet_main/model/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'Utils/colors.dart';
import 'Utils/diamensions.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  AppColumn({
    super.key,
    required this.text,
    required this.snap,
  });
  final Map<String, dynamic> snap;
  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            BigText(
              text: text,
              size: Dimensions.font26,
            ),
            SizedBox(width: Dimensions.width20),
            BigText(
              text: "₹${snap['price']}",
              size: Dimensions.font20,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                if (await FirebaseMethods().alreadyExistInFavorite(
                    FirebaseAuth.instance.currentUser!.uid, snap['title'])) {
                  showCustomSnackBar(
                    'Already exist in the favorites',
                    title: 'Existing',
                    color: Colors.red,
                  );
                } else {
                  String id = const Uuid().v1();
                  FavoriteModel product = FavoriteModel(
                    title: snap['title'],
                    price: double.parse(snap['price']),
                    image: snap['image'],
                    description: snap['description'],
                    distance: double.parse(snap['distance']),
                    rating: double.parse(snap['rating']),
                    star: double.parse(snap['star']),
                    uId: FirebaseAuth.instance.currentUser!.uid,
                    productId: id,
                  );
                  await FirebaseMethods().addToFav(product);
                  log('favoriteeeeeeee');
                }
              },
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                  right: Dimensions.width20 / 2,
                  left: Dimensions.width20 / 2,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    color: Colors.black12),
                child: Icon( Icons.favorite_border_outlined,
                    color: AppColors.mainColor,
                    size: Dimensions.iconSize24,
                  ),
                
              ),
            ),
          ],
        ),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                int.parse(snap['star']),
                (index) => const Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15,
                ),
              ),
            ),
            const SizedBox(width: 10),
            SmallText(text: snap['rating']),
          ],
        ),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            const IconAndTextWidget(
              icon: Icons.circle_sharp,
              text: 'Normal',
              iconColor: Colors.orangeAccent,
            ),
            SizedBox(width: Dimensions.width20),
            IconAndTextWidget(
              icon: Icons.location_on,
              text: '${snap['distance']} km',
              iconColor: Colors.deepOrangeAccent,
            ),
            SizedBox(width: Dimensions.width20 * 1.5),
            IconAndTextWidget(
              icon: Icons.access_time_filled_rounded,
              text: '${snap['time']} min',
              iconColor: Colors.brown,
            ),
          ],
        )
      ],
    );
  }
}
