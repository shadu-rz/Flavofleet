import 'package:flavour_fleet_main/Pages/Food/popular_food_details.dart';
import 'package:flavour_fleet_main/Pages/Food/recomended_food_details.dart';
import 'package:flavour_fleet_main/Pages/Home/home_page.dart';
import 'package:flavour_fleet_main/Pages/Splash/splash_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getSplashScreen() => splashPage;
  static String getInitial() => initial;
  static String getPopularFood(int pageId) => '$popularFood?pageId = $pageId';
  static String getRecommendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: ()=>SpalshScreen()),
    GetPage(name: "/", page: () => const HomePage()),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetails(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return RecomendedFoodDetails(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
  ];
}
