import 'dart:convert';
import 'dart:developer';
import 'package:flavour_fleet_main/Pages/place%20order/place_order.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/show_custom_snackbar.dart';
import 'package:flavour_fleet_main/Widgets/small_text.dart';
import 'package:flavour_fleet_main/firebase/firebase_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class PaymentMethodSelect extends StatefulWidget {
  Map<String, dynamic> snap;
  Map<String, dynamic>? productSnap;
  final bool isCart;
  PaymentMethodSelect({
    super.key,
    required this.snap,
     this.productSnap,
     required this.isCart,
  });

  @override
  State<PaymentMethodSelect> createState() => _PaymentMethodSelectState();
}

class _PaymentMethodSelectState extends State<PaymentMethodSelect> {
  Map<String, dynamic>? paymentIntentData;

  final FirebaseMethods firebase = Get.put(FirebaseMethods());

  late RxNum total = firebase.totalPrice;

  RxBool codChecked = false.obs;
  RxBool upiChecked = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                navigator!.pop();
              },
              child: BigText(text: 'cancel'))
        ],
      ),
      body: Column(
        children: [
          SmallText(
            text: 'Select a payment method',
            color: AppColors.mainBlackColor,
            size: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 70,
            width: Dimensions.screenWidth,
            child: Row(
              children: [
                Obx(
                  () => Checkbox(
                    value: codChecked.value,
                    onChanged: (value) {
                      codChecked.value = !codChecked.value;
                      if (codChecked.value) {
                        upiChecked.value = false;
                      }
                    },
                  ),
                ),
                SmallText(
                  text: 'Cash on delivery / Pay on delivery',
                  color: AppColors.mainBlackColor,
                  size: 14,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 70,
            width: Dimensions.screenWidth,
            child: Row(
              children: [
                Obx(
                  () => Checkbox(
                    value: upiChecked.value,
                    onChanged: (value) {
                      upiChecked.value = !upiChecked.value;
                      if (upiChecked.value) {
                        codChecked.value = false;
                      }
                    },
                  ),
                ),
                SmallText(
                  text: 'Card payment',
                  color: AppColors.mainBlackColor,
                  size: 14,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SmallText(
                text: 'total amount : ₹ $total',
                color: Colors.red,
                size: 15,
              ),
              const SizedBox(
                width: 30,
              )
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () async {
              String amount = total.floor().toString();
              if (upiChecked.value) {
                await makePayment(amount: amount, currency: "INR");
                log('card Payment called');
              } else if (codChecked.value) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PlaceOrder(
                      isCart: widget.isCart,
                      productSnap: widget.productSnap!,
                      snap: widget.snap,
                    ),
                  ),
                );
                log('cash on delivery called');
              } else {
                showCustomSnackBar('Select any Payment method',
                    color: Colors.red);
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              width: Dimensions.screenWidth,
              child: Center(
                  child: SmallText(
                text: 'Continoue',
                color: AppColors.mainBlackColor,
                size: 16,
              )),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> makePayment(
      {required String amount, required String currency}) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Prospects',
          customerId: paymentIntentData!['customer'],
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
        ));
        await displayPaymentSheet();
        
        Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PlaceOrder(
          isCart: widget.isCart,
          productSnap: widget.productSnap!,
          snap: widget.snap,
        ),
      ));
      }
    } catch (e, s) {
      log('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      log('success');
      
    } on Exception catch (e) {

      if (e is StripeException) {
        log("Error from Stripe: ${e.error.localizedMessage}");
      } else {
        log("Unforeseen error: $e");
      }
    } catch (e) {
      log("exception:$e");
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51NVoyISD7zaZsASx1c2vny1CcfWgHLINEbFmpzPRICaa8b4cBMcqi7IFky8lfNnurnLcsJpPCTlbDYnZqMUr5ezJ00xh5bnOSD',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body);
    } catch (err) {
      log('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
