import 'package:get/get.dart';

class UserController extends GetxController {
  String? userName;
  String? profileImage;
  String? email;
  String? mobileNumber;
  

  void setUserName(String name) {
    userName = name;
    update();
  }

  void setProfileImage(String image) {
    profileImage = image;
    update();
  }

  void setEmail(String userEmail) {
    email = userEmail;
    update();
  }
  void setMobileNumber(String? number) {
    mobileNumber = number;
    update();
  }


}
