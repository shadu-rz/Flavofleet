import 'package:flavofleet_main/firebase/firebase_methods.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var count = 1.obs;



  int decrementInCart(int countInCart, String productId) {
    if (countInCart > 1) {
      countInCart--;
    } else {
      FirebaseMethods().removeItemFromCart(productId);
    }
    return countInCart;
  }
    int incrementInCart(int countInCart) {
    if (countInCart >= 10) {
      return 10;
    } else {
      countInCart++;
    }
    return countInCart;
  }

 
}
