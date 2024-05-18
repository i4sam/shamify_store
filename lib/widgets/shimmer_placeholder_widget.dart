import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlaceholder extends StatelessWidget {
  final double width;
  final double height;
  final Duration duration;

  const ShimmerPlaceholder({
    super.key,
    required this.width,
    required this.height,
    this.duration = const Duration(seconds: 2),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      period: duration,
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
      ),
    );
  }
}
