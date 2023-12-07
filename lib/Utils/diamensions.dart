import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  
  static double pageView = screenHeight/2.29;
  static double pageViewContainer = screenHeight/3.9;
  static double pageViewTextContainer = screenHeight/6.5;

  // Dynamic height for Padding and margin

  static double height5 = screenHeight/156;
  static double height10 = screenHeight/78;
  static double height20 = screenHeight/39;
  static double height15 = screenHeight/52;
  static double height30 = screenHeight/26;
  static double height45 = screenHeight/17;

  //Icon Size
  static double iconSize16 = screenHeight/52.75;
  static double iconSize24 = screenHeight/35.17;


  // Dynamic Width for Padding and margin

  static double width10 = screenHeight/78;
  static double width20 = screenHeight/39;
  static double width15 = screenHeight/52;

  //Dynamic Font size
  static double font20 = screenHeight/ 39; 
  static double font15 = screenHeight/ 45; 
  static double font26 = screenHeight/ 32; 

  //Dynamic radius
  static double radius15 = screenHeight/ 52;
  static double radius20 = screenHeight/ 39;
  static double radius30 = screenHeight/ 26;


  static double populaFoodImageSize = screenHeight/ 2.41;

  //Dynamic Bottom height
  static double bottomHeightBar = screenHeight/7.3;
  
}