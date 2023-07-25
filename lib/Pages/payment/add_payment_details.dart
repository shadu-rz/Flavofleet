// import 'dart:convert';
// import 'dart:developer';
// import 'package:http/http.dart' as http;

// import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
// import 'package:flavour_fleet_main/Widgets/small_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

// class AddPaymentDetails extends StatefulWidget {
//   const AddPaymentDetails({super.key});

//   @override
//   State<AddPaymentDetails> createState() => _AddPaymentDetailsState();
// }

// class _AddPaymentDetailsState extends State<AddPaymentDetails> {

//   Map<String,dynamic>? paymentIntent;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: SmallText(
//             text: 'Add Card Details',
//             color: AppColors.mainBlackColor,
//             size: 18),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SmallText(
//                 text: 'Card Form', color: AppColors.mainBlackColor, size: 18),
//             const SizedBox(height: 10),
//             // CardField(
//             //   controller: CardEditController(),
//             // ),
//             const SizedBox(height: 10),
//             // const Spacer(),
//             ElevatedButton(
//               onPressed: ()async {
//                await payment();
//                print('hello');
//               },
//               child: SmallText(
//                 text: 'Pay',
//                 color: AppColors.mainBlackColor,
//                 size: 17,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }


// }
