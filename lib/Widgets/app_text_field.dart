
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final bool obscureText;
  final IconData icon;
  final TextInputType keyboardType;
  final Color textColor;

  const AppTextField({
    super.key,
    required this.textController,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.keyboardType = TextInputType.name,
    this.textColor = const Color.fromARGB(255, 116, 185, 181),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimensions.height20, right: Dimensions.height20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(1, 10),
                color: Colors.grey.withOpacity(0.2))
          ]),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        controller: textController,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(
              icon,
              color: textColor,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 1.0, color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 1.0, color: Colors.white)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
