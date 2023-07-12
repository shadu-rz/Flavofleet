// import 'package:flavour_fleet_main/Data/repository/cart_repo.dart';
// import 'package:flavour_fleet_main/Model/cart_model.dart';
// import 'package:flavour_fleet_main/Model/products_model.dart';
// import 'package:get/get.dart';

// class CartController extends GetxController {
//   final CartRepo cartRepo;
//   CartController({required this.cartRepo});
//   Map<int, CartModel> _items ={};

//   void addItem(ProductModel product, int quantity){
//     _items.putIfAbsent(product.id!, () { 
//       _items.forEach((key, value) { 
//         // print('quantity is '+value.quantity.toString());
//       });
//       return CartModel(
//       id:product.id,
//       name:product.name,
//       price:product.price,
//       img:product.img,
//       quantity: quantity,
//       isExist:true,
//       time:DateTime.now().toString(),
//     );
//   });
  


//   }
// }