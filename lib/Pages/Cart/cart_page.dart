import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/small_text.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final int totalItemInCart = 10;
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        title: const Text('Cart'),
      ),
      body: Stack(
        children: [
          // Positioned(
          //   top: Dimensions.height20 * 2.5,
          //   left: Dimensions.width20,
          //   right: Dimensions.width20,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       GestureDetector(
          //         onTap: () => navigator!.pop(),
          //         child: AppIcon(
          //           icon: Icons.clear,
          //           iconColor: Colors.white,
          //           backgroundColor: AppColors.mainColor,
          //           size: Dimensions.iconSize24 * 2,
          //         ),
          //       ),
          //       SizedBox(
          //         width: Dimensions.width20 * 9,
          //       ),
          //       GestureDetector(
          //         onTap: () => navigator!.pushReplacement(
          //           MaterialPageRoute(
          //             builder: (context) => const HomePage(),
          //           ),
          //         ),
          //         child: AppIcon(
          //           icon: Icons.home,
          //           iconColor: Colors.white,
          //           backgroundColor: AppColors.mainColor,
          //           size: Dimensions.iconSize24 * 2,
          //         ),
          //       ),
          //       GestureDetector(
          //         onTap: () => navigator!.push(
          //           MaterialPageRoute(
          //             builder: (context) => const CartHistory(),
          //           ),
          //         ),
          //         child: AppIcon(
          //           icon: Icons.shopping_cart,
          //           iconColor: Colors.white,
          //           backgroundColor: AppColors.mainColor,
          //           size: Dimensions.iconSize24 * 2,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height10,
            bottom: 0,
            child: Container(
              // color: Colors.red[300],
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: Dimensions.height10,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: Dimensions.height10),
                      // color: Colors.amber,
                      height: 100,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Container(
                            width: Dimensions.height20 * 5,
                            height: Dimensions.height20 * 5,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/image/food2.jpg')),
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          Expanded(
                              child: Container(
                            height: Dimensions.height20 * 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                BigText(
                                  text: 'Bitter orange juice',
                                  size: Dimensions.font20,
                                  color: Colors.black54,
                                ),
                                SmallText(text: 'spicy'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BigText(
                                      text: '\$ 33.0',
                                      size: Dimensions.font20,
                                      color: Colors.redAccent,
                                    ),
                                    //containerrr
                                    Container(
                                      padding: EdgeInsets.only(
                                        top: Dimensions.height10,
                                        bottom: Dimensions.height10,
                                        right: Dimensions.width20 / 2,
                                        left: Dimensions.width20 / 2,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius15),
                                          color: Colors.white),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            // onTap: () => popularProduct
                                            //     .setQuantity(false),
                                            child: const Icon(
                                              Icons.remove,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          BigText(
                                              text:
                                                  "0" //popularProduct.quantity
                                              // .toString()
                                              ),
                                          GestureDetector(
                                            onTap: () {
                                              // popularProduct.setQuantity(true);
                                            },
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.grey,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
              bottom: double.minPositive,
              child: Container(
                height: Dimensions.height10 * 6,
                width: Dimensions.screenWidth,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: Dimensions.height20 * 2,
                      width: Dimensions.height45 * 2.3,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15)),
                      child: Center(
                        child: BigText(text: 'Total: 5'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: Dimensions.height20 * 2,
                      width: Dimensions.height45 * 3,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15)),
                      child: Center(
                        child: BigText(text: 'Check Out'),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),

      // bottomNavigationBar: Container(
      //   height: Dimensions.height30 * 3,
      //   padding: EdgeInsets.only(
      //     left: Dimensions.width20,
      //     right: Dimensions.width20,
      //   ),
      //   decoration: BoxDecoration(
      //       color: Colors.grey[200],
      //       borderRadius: BorderRadius.only(
      //           topLeft: Radius.circular(Dimensions.radius20),
      //           topRight: Radius.circular(Dimensions.radius20))),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       Container(
      //         height: Dimensions.height45 * 1.2,
      //         width: Dimensions.width20 * 7,
      //         decoration: BoxDecoration(
      //             color: Colors.grey[400],
      //             borderRadius: BorderRadius.circular(Dimensions.radius20)),
      //         child: Center(child: BigText(text: 'TOTAL : $totalItemInCart')),
      //       ),
      //       Container(
      //         height: Dimensions.height45 * 1.2,
      //         width: Dimensions.width20 * 6.5,
      //         decoration: BoxDecoration(
      //             color: AppColors.mainColor,
      //             borderRadius: BorderRadius.circular(Dimensions.radius20)),
      //         child: Center(
      //             child: BigText(text: 'Check Out', color: Colors.white)),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
