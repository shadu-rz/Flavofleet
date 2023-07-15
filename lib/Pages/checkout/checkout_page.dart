import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){}, child: BigText(text: 'cancel'))
        ],
      ),
    );
  }
}