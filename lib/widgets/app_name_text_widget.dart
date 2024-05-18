import 'package:e_store/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppNameTextWidget extends StatelessWidget {
  const AppNameTextWidget({
    super.key,
    this.fontSize = 24,
  });
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 5),
      baseColor: Colors.purple,
      highlightColor: Colors.yellow,
      child: TitleWidget(
        label: 'Shamify',
        fontSize: fontSize,
      ),
    );
  }
}
