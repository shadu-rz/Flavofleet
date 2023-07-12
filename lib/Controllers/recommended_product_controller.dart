import 'package:flavour_fleet_main/Model/products_model.dart';
import 'package:get/get.dart';

import '../Data/repository/recomended_product_repo.dart';

class RecommendedProductController extends GetxController{
    final RecommendedProductRepo recommendedProductRepo;
    RecommendedProductController({required this.recommendedProductRepo});

    List<dynamic> _recommendedProductList=[];
    List<dynamic> get recommendedProductList => _recommendedProductList;

    bool _isLoaded = false;
    bool get isLoaded =>_isLoaded;

    Future<void>  getrecommendedProductList()async{
     
     Response response = await recommendedProductRepo.getRecommendedProductList();
     if (response.statusCode==200) {
      // print('Got products');
       _recommendedProductList=[];
       _recommendedProductList.addAll(Product.fromJson(response.body).products);
      //  print(_recommendedProductList);
        _isLoaded = true;
       update();
     }else{
      
     }
    }
}