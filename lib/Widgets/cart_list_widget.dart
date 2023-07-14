import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flutter/material.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigText(
                      text: 'Bitter orange juice',
                      size: Dimensions.font20,
                      color: Colors.black54,
                    ),
                   
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
    );
  }
}
