import 'package:flavofleet_main/Widgets/Utils/diamensions.dart';
import 'package:flutter/material.dart';

class ImagePopFoodDetails extends StatelessWidget {
  const ImagePopFoodDetails({
    super.key,
    required this.snap,
  });

  final Map<String, dynamic> snap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      child: Container(
        width: double.maxFinite,
        height: Dimensions.populaFoodImageSize,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(snap['image']),
          ),
        ),
      ),
    );
  }
}

