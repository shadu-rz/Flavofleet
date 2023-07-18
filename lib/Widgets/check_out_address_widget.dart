import 'package:flavour_fleet_main/Pages/buy%20now/buy_now_page.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutAddressWidget extends StatelessWidget {
  const CheckOutAddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), border: Border.all()),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmallText(
                text: 'Mohamed kasim p',
                color: Colors.black,
              ),
              SizedBox(height: 10),
              SmallText(
                text:
                    'pulikkal (h) marakkara (po) kadampuzha, 676307 kerala ,india',
                color: Colors.black,
              ),
              SizedBox(height: 10),
              SmallText(
                text: 'phone number : 9946610252',
                color: Colors.black,
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  navigator!.push(MaterialPageRoute(builder: (context) => BuyNowPage(),));
                },
                child: Container(
                  width: Dimensions.screenWidth,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius20 / 2),
                      color: AppColors.mainColor),
                  child: Center(
                    child: BigText(
                      text: 'Use this address',
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), border: Border.all()),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmallText(
                text: 'Mohamed Shaduli kk',
                color: Colors.black,
              ),
              SizedBox(height: 10),
              SmallText(
                text:
                    'Kayalmadathil kanavath (h) ananthavoor (po) iqbalnagar, 676301 kerala ,india',
                color: Colors.black,
              ),
              SizedBox(height: 10),
              SmallText(
                text: 'phone number : 9048184448',
                color: Colors.black,
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  navigator!.push(MaterialPageRoute(builder: (context) => BuyNowPage(),));
                },
                child: Container(
                  width: Dimensions.screenWidth,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius20 / 2),
                      color: AppColors.mainColor),
                  child: Center(
                    child: BigText(
                      text: 'Use this address',
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
