import 'package:flavour_fleet_main/Pages/place%20order/place_order.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/small_text.dart';
import 'package:flavour_fleet_main/firebase/firebase_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodSelect extends StatelessWidget {

  final FirebaseMethods firebase = Get.put(FirebaseMethods());
  
   PaymentMethodSelect({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            navigator!.pop();
          }, child: BigText(text: 'cancel'))
        ],
      ),
      body: Column(
        children: [
          SmallText(text: 'Select a payment method',color: AppColors.mainBlackColor,size: 20,),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
               color: Colors.white, border: Border.all(), borderRadius: BorderRadius.circular(10),
            ),
            height: 70,
            width: Dimensions.screenWidth,
           child: Row(
            children: [
              Checkbox(value: isBlank, onChanged: (value) {
                
              },),
              SmallText(text: 'Cash on delivery / Pay on delivery',color: AppColors.mainBlackColor,size: 14,)
            ],
           ),
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
               color: Colors.white, border: Border.all(), borderRadius: BorderRadius.circular(10),
            ),
            height: 70,
            width: Dimensions.screenWidth,
           child: Row(
            children: [
              Checkbox(value: true, onChanged: (value) {
              },),
              SmallText(text: 'UPI or other payment',color: AppColors.mainBlackColor,size: 14,)
            ],
           ),
          ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SmallText(text: 'total amount : ${firebase.observetotalPrice}',color: Colors.red,size: 15,),
              SizedBox(width: 30,)
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () { navigator!.push(MaterialPageRoute(builder: (context) => const PlaceOrder()));},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              decoration: BoxDecoration(
                 color: Colors.white, border: Border.all(), borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              width: Dimensions.screenWidth,
              child: Center(child: SmallText(text: 'Continoue',color: AppColors.mainBlackColor,size: 16,)),
            ),
          ),
        ],
      ),
    );
  }
}