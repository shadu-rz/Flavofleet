import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/Widgets/horizontal_scroll_widget.dart';
import 'package:flutter/material.dart';

class HomePageHorSlideWidget extends StatelessWidget {
  const HomePageHorSlideWidget({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.yellow,
      height: Dimensions.screenHeight / 2.8,
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('popularProducts')
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                  snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return BigText(text: 'No Item');
            }

            return PageView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              controller: pageController,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var snap = snapshot.data!.docs[index].data();
                return HorizontalScrollWidget(snap: snap);
              },
            );
          }),
    );
  }
}
