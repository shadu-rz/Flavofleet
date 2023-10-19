import 'package:get/get.dart';

class FavButtonController extends GetxController {

  RxBool favChecked = false.obs;
  void toggleFav(){
    favChecked.value = !favChecked.value;
  }
  
}