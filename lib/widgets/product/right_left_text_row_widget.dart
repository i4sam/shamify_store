import 'package:e_store/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class RightLeftTextRowWidget extends StatelessWidget {
  const RightLeftTextRowWidget({
    super.key,
    required this.rightText,
    required this.leftText,
    this.leftTextColor,
    this.rightTextColor,
  });
  final String rightText;
  final String leftText;
  final Color? leftTextColor;
  final Color? rightTextColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(
            label: leftText,
            fontSize: 20,
            color: leftTextColor,
            maxLines: 2,
          ),
          TitleWidget(
            fontSize: 20,
            maxLines: 2,
            label: rightText,
            color: rightTextColor,
          )
        ],
      ),
    );
  }
}
