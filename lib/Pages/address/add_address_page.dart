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
  TextEditingController _addressController = TextEditingController();
  // final TextEditingController _contactPersonName = TextEditingController();
  // final TextEditingController _contactPersonNumber = TextEditingController();
  late bool isLogged;
  // final CameraPosition _cameraPosition = const CameraPosition(
  //   target: LatLng(10.933406381023925, 76.00130423779683),
  //   zoom: 17,
  // );
  // late LatLng _initialPosition = LatLng(10.933406381023925, 76.00130423779683);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address page'),
        backgroundColor: AppColors.mainColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height10,
                  right: Dimensions.width20,
                  left: Dimensions.width20),
              height: Dimensions.height45 * 4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor)),
              child: const Stack(
                children: [
                  // GoogleMap(
                  //   initialCameraPosition:
                  //       CameraPosition(target: _initialPosition, zoom: 70),
                  // ),
                ],
              ),
            ),
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
              child: BigText(text: 'Delivery address'),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
                textController: _addressController,
                hintText: 'Malappuram,Kerala,India',
                icon: Icons.map),
            SizedBox(
              height: Dimensions.height20,
            ),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.width20),
              child: BigText(text: 'contact name'),
            ),
            SizedBox(height: Dimensions.height20),
            AppTextField(
                textController: _addressController,
                hintText: 'ShaduRz',
                icon: Icons.person),
            SizedBox(height: Dimensions.height20),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.width20),
              child: BigText(text: 'contact number'),
            ),
            SizedBox(height: Dimensions.height20),
            AppTextField(
                textController: _addressController,
                hintText: '9048184448',
                icon: Icons.call),
            SizedBox(height: Dimensions.height20),
            GestureDetector(
              onTap: () => navigator!.pop(),
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
                    text: 'Save Address',
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
