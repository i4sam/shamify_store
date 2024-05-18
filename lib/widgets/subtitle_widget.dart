import 'package:flutter/material.dart';

class SubtitleWidget extends StatelessWidget {
  final String label;
  final double fontSize;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration textDecoration;
  final TextAlign? alignment;

  const SubtitleWidget({
    super.key,
    required this.label,
    this.color,
    this.fontSize = 16,
    this.fontStyle,
    this.fontWeight = FontWeight.normal,
    this.textDecoration = TextDecoration.none,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      ),
      textAlign: alignment,
    );
  }
}
