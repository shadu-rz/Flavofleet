import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      title: BigText(text: 'Order Details'),
      ),
    );
  }
}