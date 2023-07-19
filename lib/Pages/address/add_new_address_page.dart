import 'package:flavour_fleet_main/Pages/address/select_address.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/small_text.dart';
import 'package:flavour_fleet_main/firebase/firebase_methods.dart';
import 'package:flavour_fleet_main/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  late bool isLogged;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BigText(text: 'Address new address'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Dimensions.height20),
          Padding(
            padding: EdgeInsets.only(left: Dimensions.width20),
            child: SmallText(
              text: 'Full name',
              size: 15,
              color: Colors.grey,
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: TextField(
              controller: nameController,
            ),
          ),
          SizedBox(height: Dimensions.height20),
          Padding(
            padding: EdgeInsets.only(left: Dimensions.width20),
            child:
                SmallText(text: 'contact number', size: 15, color: Colors.grey),
          ),
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: TextField(
              controller: phoneController,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          Padding(
            padding: EdgeInsets.only(left: Dimensions.width20),
            child: SmallText(text: 'Address', size: 15, color: Colors.grey),
          ),
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: TextField(
              controller: addressController,
            ),
          ),
          SizedBox(height: Dimensions.height10),
          SizedBox(
            height: Dimensions.height10,
          ),
          Padding(
            padding: EdgeInsets.only(left: Dimensions.width20),
            child: SmallText(
              text: 'pincode',
              size: 15,
              color: Colors.grey,
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: TextField(
              controller: pincodeController,
              keyboardType: TextInputType.number,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () async{
              AddressModel addressModel = AddressModel(
                name: nameController.text,
                address: addressController.text,
                phone: phoneController.text,
                pincode: pincodeController.text,
              );
              await FirebaseMethods().addAddress(addressModel);
              navigator!.push(MaterialPageRoute(
                builder: (context) => SelectAddress(),
              ));
            },
            child: Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height20),
              width: Dimensions.screenWidth,
              height: Dimensions.screenHeight / 14,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
                  color: AppColors.mainColor),
              child: Center(
                child: BigText(
                  text: 'Continoue',
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}