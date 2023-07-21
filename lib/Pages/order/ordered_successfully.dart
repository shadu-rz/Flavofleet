import 'package:flavour_fleet_main/Pages/Home/home_page.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderdSuccessfully extends StatelessWidget {
  const OrderdSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              child: Icon(
                Icons.check,
                size: 52,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BigText(text: 'Ordered Successfully'),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () => navigator!.pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    ),
                child: SmallText(
                  text: 'Go to home',
                  color: Colors.blue,
                  size: 15,
                )),
          ],
        ),
      ),
    );
  }
}
