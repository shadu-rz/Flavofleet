import 'package:flavour_fleet_main/Pages/buy%20now/buy_now_page.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/app_icon.dart';
import 'package:flavour_fleet_main/Widgets/app_text_field.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  TextEditingController addressController = TextEditingController();
  late bool isLogged;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address page'),
        backgroundColor: AppColors.mainColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Dimensions.height20),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.width20),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                    ),
                    height: Dimensions.height30 + Dimensions.height20 + 5,
                    width: 50,
                    child: const AppIcon(
                      icon: Icons.home,
                      iconColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: Dimensions.width10),
                  Container(
                    height: Dimensions.height30 + Dimensions.height20 + 5,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                    ),
                    width: 50,
                    child: const AppIcon(
                      icon: Icons.work,
                      iconColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: Dimensions.width10),
                  Container(
                    height: Dimensions.height30 + Dimensions.height20 + 5,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                    ),
                    width: 50,
                    child: const AppIcon(
                      icon: Icons.dashboard_customize,
                      iconColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.width20),
              child: BigText(text: 'contact name'),
            ),
            SizedBox(height: Dimensions.height10),
            AppTextField(
                textController: addressController,
                hintText: 'ShaduRz',
                icon: Icons.person),
            SizedBox(height: Dimensions.height20),
             Padding(
              padding: EdgeInsets.only(left: Dimensions.width20),
              child: BigText(text: 'contact number'),
            ),
            SizedBox(height: Dimensions.height10),
            AppTextField(
                textController: addressController,
                hintText: '9048184448',
                icon: Icons.call),
            SizedBox(height: Dimensions.height10),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.width20),
              child: BigText(text: 'Flat, House no., Building, company'),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            AppTextField(
              textController: addressController,
              hintText: '',
              icon: Icons.map,
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
             Padding(
              padding: EdgeInsets.only(left: Dimensions.width20),
              child: BigText(text: 'Flat, House no., Building, company'),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            AppTextField(
              textController: addressController,
              hintText: '',
              icon: Icons.map,
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
             Padding(
              padding: EdgeInsets.only(left: Dimensions.width20),
              child: BigText(text: 'Landmark'),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            AppTextField(
              textController: addressController,
              hintText: 'E.g near hello hospital',
              icon: Icons.map,
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
             Padding(
              padding: EdgeInsets.only(left: Dimensions.width20),
              child: BigText(text: 'pincode'),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            AppTextField(
              textController: addressController,
              hintText: '6 digits[0-9] PIN code',
              icon: Icons.map,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            
           
            GestureDetector(
              onTap: () => navigator!.push(MaterialPageRoute(builder: (context) => const BuyNowPage(),)),
              child: Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height20),
                width: Dimensions.screenWidth,
                height: Dimensions.screenHeight / 14,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius20 / 2),
                    color: AppColors.mainColor),
                child: Center(
                  child: BigText(
                    text: 'Next',
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
