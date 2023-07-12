
import 'package:flavour_fleet_main/Data/repository/popular_product_repo.dart';
import 'package:flavour_fleet_main/Widgets/Utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controllers/popular_product_controller.dart';
import '../Controllers/recommended_product_controller.dart';
import '../Data/api/api_client.dart';
import '../Data/repository/recomended_product_repo.dart';

Future<void> init() async {

  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
}
