
import 'package:flavour_fleet_main/firebase/firebase_methods.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var count = 1.obs;



  int incrementInCart(int countInCart) {
    if (countInCart >= 10) {
      return 10;
    } else {
      countInCart++;
    }
    return countInCart;
  }

  int decrementInCart(int countInCart,String productId) {
    if (countInCart > 1) {
      countInCart--;
    } else {
     FirebaseMethods().removeItemFromCart(productId);
    }
    return countInCart;
  }

  // void increment() {
  //   if (count >= 15) {
  //     showCustomSnackBar("you can't add more than 15",
  //         title: 'Limit reached', color: Colors.red);
  //   } else {
  //     count.value++;
  //   }
  // }
  

  // void decrement() {
  //   if (count > 1) {
  //     count.value--;
  //   } else {
  //     showCustomSnackBar(
  //       "you can't less than 1",
  //       title: 'Minimun count',
  //       color: Colors.red,
  //     );
  //   }
  // }
}
