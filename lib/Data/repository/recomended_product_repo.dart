import 'package:flavour_fleet_main/Data/api/api_client.dart';
import 'package:flavour_fleet_main/Widgets/Utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.recommendedProductUrl);
  }
}
