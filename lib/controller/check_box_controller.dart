import 'package:get/get.dart';

class CheckboxController extends GetxController {
  RxBool codChecked = false.obs;
  RxBool upiChecked = false.obs;

  void toggleCodCheckbox() {
    codChecked.value = !codChecked.value;
    if (codChecked.value) {
      upiChecked.value = false;
    }
  }

  void toggleUpiCheckbox() {
    upiChecked.value = !upiChecked.value;
    if (upiChecked.value) {
      codChecked.value = false;
    }
  }
  
}
