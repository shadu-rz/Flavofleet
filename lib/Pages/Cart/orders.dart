import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/small_text.dart';
import 'package:flutter/material.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: 'Orders',
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(
               horizontal: Dimensions.width20
              ),
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return Container(height: 1,color: Colors.grey,);
                },
                itemCount: 10,
                itemBuilder: (context, index) {
                  final int ind = index+1;
                  return SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              child: BigText(text: ind.toString()),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(
                                  text: '02-12-2022 ',
                                  color: AppColors.mainBlackColor,
                                  size: 16,
                                ),
                                SmallText(
                                  text: ' 09:10:52. 286567',
                                  color: AppColors.mainBlackColor,
                                  size: 16,
                                ),
                              ],
                            ),
                            SizedBox(
                              // color: Colors.amber,
                              height: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SmallText(text: 'Total',color: Colors.grey,),
                                  BigText(text: '2 items'),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
