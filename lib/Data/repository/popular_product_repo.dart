import 'package:flavour_fleet_main/Data/api/api_client.dart';
import 'package:flavour_fleet_main/Widgets/Utils/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.popularProductUrl);
  }
}
