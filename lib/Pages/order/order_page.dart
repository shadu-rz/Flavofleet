import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Center(child: Text('Orders')),
      ),
    );
  }
}
