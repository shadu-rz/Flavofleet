import 'package:flavour_fleet_main/Data/repository/popular_product_repo.dart';
import 'package:flavour_fleet_main/Model/products_model.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  // late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _incartItems = 0;
  int get inCartItems => _incartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      // print('Got products');
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      update();
      _isLoaded = true;
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      // print('increment');
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar(
        'Item Count',
        "You can't reduce more",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if (quantity > 20) {
      Get.snackbar(
        'Item Count',
        "You can't add more",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      //you can change by the data from the server
      return 20;
    } else {
      return quantity;
    }
  }

  // void initProduct(CartController cart){
  //   _quantity = 0;
  //   _incartItems=0;
  //   _cart=cart;

  //   // if exists
  //   // get from storage _inCartItems=3
  // }

  // void addItem(ProductModel product){
  //   _cart.addItem(product, quantity);
  // }
}
