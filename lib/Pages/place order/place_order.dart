import 'package:flavour_fleet_main/Pages/order/ordered_successfully.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlaceOrder extends StatelessWidget {
  const PlaceOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                navigator!.pop();
              },
              child: BigText(text: 'cancel'))
        ],
      ),
      body: Column(
        children: [
          SmallText(
            text: 'Order Now',
            color: AppColors.mainBlackColor,
            size: 18,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), border: Border.all()),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 110,
            width: double.maxFinite,
            child: Column(
              children: [
                Row(
                  children: [
                    SmallText(text: 'Items :',color: AppColors.mainBlackColor,),
                    Spacer(),
                    SmallText(text: '₹ 1250',color: AppColors.mainBlackColor,size: 15,)
                  ],
                ),
                Row(
                  children: [
                    SmallText(text: 'Delivery :',color: AppColors.mainBlackColor,),
                    Spacer(),
                    SmallText(text: '₹ 50',color: AppColors.mainBlackColor,size: 15,)
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    BigText(text: 'Order Total :',color: Colors.red,),
                    Spacer(),
                    BigText(text: '₹ 1300',color: Colors.red,)
                  ],
                ),

              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
             decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), border: Border.all()),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 60,
            width: double.maxFinite,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: 'Pay with',color:AppColors.mainBlackColor,),
                    Spacer(),
                    SmallText(text: 'Pay on delivery (Cash/card)',color:Colors.red,),
                    
                  ],
                ),
                Spacer(),
                Icon(Icons.arrow_right_sharp)
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
             decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), border: Border.all()),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 80,
            width: double.maxFinite,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: 'Delivery to',color:AppColors.mainBlackColor,),
                    Spacer(),
                    SmallText(text: 'MOHAMED SHADULI KK',color:AppColors.mainBlackColor,),
                    SmallText(text: 'KAYALMADATHIL KANAVATH (H) ANANTHAVOOR..',color:AppColors.mainBlackColor,),
                    
                  ],
                ),
                Spacer(),
                Icon(Icons.arrow_right_sharp)
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              navigator!.push(MaterialPageRoute(builder: (context) => const OrderdSuccessfully(),));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), border: Border.all()),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              height: 40,
              width: double.maxFinite,
              child: Center(child: SmallText(text: 'Place your order',color: AppColors.mainBlackColor,)),
            ),
          ),
        ],
      ),
    );
  }
}
