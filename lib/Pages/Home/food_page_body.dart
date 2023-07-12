import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flavour_fleet_main/Controllers/popular_product_controller.dart';
import 'package:flavour_fleet_main/Controllers/recommended_product_controller.dart';
import 'package:flavour_fleet_main/Model/products_model.dart';
import 'package:flavour_fleet_main/Pages/Food/popular_food_details.dart';
import 'package:flavour_fleet_main/Pages/Food/recomended_food_details.dart';
import 'package:flavour_fleet_main/Widgets/Utils/app_constants.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/icon_and_text.dart';
import 'package:flavour_fleet_main/Widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        children: [
          //Slider Section
          GetBuilder<PopularProductController>(
            builder: (popularProducts) {
              return popularProducts.isLoaded
                  ? Container(
                      // color: Colors.yellow,
                      height: Dimensions.screenHeight / 2.8,
                      child: PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          controller: pageController,
                          itemCount: popularProducts.popularProductList.length,
                          itemBuilder: (context, position) {
                            return _buildPageItem(position,
                                popularProducts.popularProductList[position]);
                          }),
                    )
                  : const CircularProgressIndicator(
                      color: AppColors.mainColor,
                    );
            },
          ),
          // dots
          GetBuilder<PopularProductController>(
            builder: (PopularProductController) {
              return DotsIndicator(
                dotsCount: PopularProductController.popularProductList.isEmpty
                    ? 1
                    : PopularProductController.popularProductList.length,
                position: _currPageValue.toInt(),
                decorator: const DotsDecorator(
                  color: Colors.white, // Inactive color
                  activeColor: AppColors.mainColor,
                ),
              );
            },
          ),
          //Recomended Text
          SizedBox(height: Dimensions.height30),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(
                height: Dimensions.height30,
                color: const Color.fromARGB(100, 184, 184, 184),
                // margin: EdgeInsets.only(left: Dimensions.width20),
                padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  bottom: Dimensions.height10 / 2,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BigText(
                      text: 'Recomended',
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    SmallText(
                      text: 'Food Pairing',
                      color: Colors.white70,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          //recomended food
          //list of food and images
          GetBuilder<RecommendedProductController>(
              builder: (recommendedProduct) {
            return recommendedProduct.isLoaded
                ? Container(
                    // color: Colors.amber,
                    // margin: EdgeInsets.only(bottom: Dimensions.height30*2),
                    padding: EdgeInsets.only(
                      bottom: Dimensions.height10,
                    ),
                    height: Dimensions.screenHeight / 2.5,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return Container(
                              height: Dimensions.height10,
                            );
                          },
                          itemCount:
                              recommendedProduct.recommendedProductList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                left: Dimensions.width20,
                                right: Dimensions.width10,
                              ),
                              child: GestureDetector(
                                onTap: () => navigator!.push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        RecomendedFoodDetails(pageId: index),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: Dimensions.height45 * 2,
                                      height: Dimensions.height45 * 2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            AppConstants.baseUrl +
                                                "/uploads/" +
                                                recommendedProduct
                                                    .recommendedProductList[
                                                        index]
                                                    .img!,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimensions.width10/2,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: Dimensions.height10,
                                        top: Dimensions.height10,
                                      ),
                                      height: Dimensions.height45 * 2,
                                      width: Dimensions.width20 * 13,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      // container box scrolling

                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          BigText(
                                            text: recommendedProduct
                                                .recommendedProductList[index]
                                                .name,
                                            size: Dimensions.font26 / 2 + 3,
                                          ),
                                          SizedBox(height: Dimensions.height5),
                                          Row(
                                            children: [
                                              Wrap(
                                                children: List.generate(
                                                  5,
                                                  (index) => const Icon(
                                                    Icons.star,
                                                    color: AppColors.mainColor,
                                                    size: 12,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              SmallText(text: '3.9'),
                                              const SizedBox(width: 10),
                                              SmallText(text: '1282'),
                                              const SizedBox(width: 10),
                                              SmallText(text: 'comments')
                                            ],
                                          ),
                                          SizedBox(height: Dimensions.height5),
                                          Row(
                                            children: const [
                                              IconAndTextWidget(
                                                icon: Icons.circle,
                                                text: 'Normal',
                                                iconColor: Colors.orangeAccent,
                                              ),
                                              IconAndTextWidget(
                                                icon: Icons.location_on,
                                                text: '1.7 Km',
                                                iconColor:
                                                    Colors.deepOrangeAccent,
                                              ),
                                              SizedBox(width: 10),
                                              IconAndTextWidget(
                                                icon: Icons
                                                    .access_time_filled_rounded,
                                                text: '32 min',
                                                iconColor: Colors.brown,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                : const CircularProgressIndicator(
                    color: AppColors.mainColor,
                  );
          })
        ],
      ),
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius15),
        // color: Colors.white38,
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              // Get.to(() => PopularFoodDetails(pageId: index));
              navigator!.push(
                MaterialPageRoute(
                  builder: (context) => PopularFoodDetails(pageId: index),
                ),
              );
            },
            child: Container(
              height: Dimensions.screenWidth / 2,
              width: Dimensions.screenWidth / 1.3,
              margin: EdgeInsets.only(
                  left: Dimensions.width10,
                  right: Dimensions.width10,
                  top: Dimensions.height10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: index.isEven ? const Color(0xFF69c5df) : Colors.yellow,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    AppConstants.baseUrl +
                        AppConstants.uploadUrl +
                        popularProduct.img!,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.screenWidth / 4.3,
              width: Dimensions.screenWidth / 1.45,
              margin: EdgeInsets.only(
                left: Dimensions.height10,
                right: Dimensions.height20,
                bottom: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    left: Dimensions.height15,
                    right: Dimensions.height15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: popularProduct.name!,
                      size: 16,
                    ),
                    SizedBox(height: Dimensions.height5),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              color: AppColors.mainColor,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SmallText(text: '4.5'),
                        const SizedBox(width: 10),
                        SmallText(text: '1282'),
                        const SizedBox(width: 10),
                        SmallText(text: 'comments')
                      ],
                    ),
                    SizedBox(height: Dimensions.height5),
                    Row(
                      children: const [
                        IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: 'Normal',
                          iconColor: Colors.orangeAccent,
                        ),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          text: '1.7 Km',
                          iconColor: Colors.deepOrangeAccent,
                        ),
                        SizedBox(width: 10),
                        IconAndTextWidget(
                          icon: Icons.access_time_filled_rounded,
                          text: '32 min',
                          iconColor: Colors.brown,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
