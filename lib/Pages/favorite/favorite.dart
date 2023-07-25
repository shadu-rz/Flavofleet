import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        title: BigText(text: 'Favorites'),
      ),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: Dimensions.height10),
            // color: Colors.amber,
            height: 100,
            width: double.maxFinite,
            child: Row(
              children: [
                SizedBox(width: Dimensions.width20),
                Container(
                  width: Dimensions.height20 * 4,
                  height: Dimensions.height20 * 4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://images.pexels.com/photos/45202/brownie-dessert-cake-sweet-45202.jpeg?cs=srgb&dl=pexels-pixabay-45202.jpg&fm=jpg'),
                      ),
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: Colors.white),
                ),
                SizedBox(
                  width: Dimensions.width20,
                ),
                Expanded(
                  child: SizedBox(
                    height: Dimensions.height20 * 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BigText(
                          text: 'Name',
                          size: Dimensions.font20 - 2,
                          color: Colors.black54,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(
                              text: '₹ 100 ',
                              size: Dimensions.font20 - 2,
                              color: Colors.redAccent,
                            ),
                            //containerrr
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                    right: Dimensions.width20 / 2,
                    left: Dimensions.width20 / 2,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: Colors.white),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          // await _showMyDialog(context,snap);
                        },
                        child: const Icon(
                          Icons.delete_outline,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
