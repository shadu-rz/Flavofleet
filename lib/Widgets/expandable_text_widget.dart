import 'package:flavofleet_main/Utils/colors.dart';
import 'package:flavofleet_main/Utils/diamensions.dart';
import 'package:flavofleet_main/Widgets/small_text.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({
    super.key,
    required this.text,
  });

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(
        textHeight.toInt() + 1,
        widget.text.length,
      );
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(text: firstHalf)
          : Column(
              children: [
                SmallText(
                  
                  text:
                      hiddenText ? ("$firstHalf...") : (firstHalf + secondHalf),
                  size: 14,
                ),
                SizedBox(height: Dimensions.height10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: hiddenText ? 'show more' : 'show less',
                        color: AppColors.mainColor,
                        size: 14,
                      ),
                      SizedBox(width: Dimensions.width10 / 2),
                      Icon(
                        hiddenText ? Icons.arrow_downward : Icons.arrow_upward,
                        color: AppColors.mainColor,
                        size: 16,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
