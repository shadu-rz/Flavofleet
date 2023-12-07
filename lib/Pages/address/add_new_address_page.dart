import 'package:flavofleet_main/Utils/diamensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:flavofleet_main/firebase/firebase_methods.dart';
import 'package:flavofleet_main/model/address_model.dart';
import 'package:flavofleet_main/Utils/big_text.dart';
import 'package:flavofleet_main/Widgets/small_text.dart';
import 'package:flavofleet_main/Utils/colors.dart';

class AddAddressPage extends StatefulWidget {
  final Map<String, dynamic>? productSnap;

  const AddAddressPage({
    super.key,
    this.productSnap,
  });

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  late bool isLogged;

  // Function to validate the mobile number
  bool validateMobile(String value) {
    if (value.length == 10) {
      return true;
    }
    return false;
  }

  // Function to validate the pincode
  bool validatePincode(String value) {
    if (value.length == 6) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BigText(text: 'Address new address'),
        actions: [
          IconButton(
            onPressed: () async {
              // Validation checks
              if (nameController.text.isEmpty ||
                  addressController.text.isEmpty ||
                  phoneController.text.isEmpty ||
                  pincodeController.text.isEmpty ||
                  !validateMobile(phoneController.text) ||
                  !validatePincode(pincodeController.text)) {
                // Show an error message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please enter valid data in all fields.'),
                    duration: Duration(seconds: 3),
                  ),
                );
              } else {
                // All fields are filled and valid, proceed with adding address
                String id = const Uuid().v1();
                AddressModel addressModel = AddressModel(
                  name: nameController.text,
                  address: addressController.text,
                  phone: phoneController.text,
                  pincode: pincodeController.text,
                  id: id,
                );

                await FirebaseMethods().addAddress(addressModel);

                navigator!.pop();
              }
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Dimensions.height20),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.width20),
              child: SmallText(
                text: 'Name',
                size: 15,
                color: AppColors.mainBlackColor,
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Your full name',
                ),
                controller: nameController,
              ),
            ),
            SizedBox(height: Dimensions.height20),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.width20),
              child: SmallText(
                text: 'Contact number',
                size: 15,
                color: AppColors.mainBlackColor,
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: '10 digit mobile number',
                ),
                controller: phoneController,
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: Dimensions.height20),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.width20),
              child: SmallText(
                text: 'Address',
                size: 15,
                color: AppColors.mainBlackColor,
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter complete address to your home',
                ),
                controller: addressController,
              ),
            ),
            SizedBox(height: Dimensions.height10),
            SizedBox(height: Dimensions.height10),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.width20),
              child: SmallText(
                text: 'Pincode',
                size: 15,
                color: AppColors.mainBlackColor,
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: '6 digit pincode',
                ),
                controller: pincodeController,
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: Dimensions.height10),
          ],
        ),
      ),
    );
  }
}
