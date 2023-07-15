import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyNowPage extends StatelessWidget {
  const BuyNowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            navigator!.pop();
          }, child: BigText(text: 'cancel'))
        ],
      ),
    );
  }
}