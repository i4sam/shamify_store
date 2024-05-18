import 'package:e_store/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.label,
    required this.function,
    required this.imagePath,
    this.tileColor,
  });
  final String label;
  final Function function;
  final String imagePath;
  final Color? tileColor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => function(),
      leading: Image.asset(
        imagePath,
        height: 36,
      ),
      title: SubtitleWidget(label: label),
      trailing: const Icon(IconlyLight.arrowRight2),
      tileColor: tileColor,
    );
  }
}
