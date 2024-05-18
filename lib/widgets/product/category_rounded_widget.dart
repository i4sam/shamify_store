import 'package:e_store/pages/search_page.dart';
import 'package:e_store/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';

class CategoryRoundedWidget extends StatelessWidget {
  const CategoryRoundedWidget(
      {super.key, required this.imagePath, required this.categoryName});
  final String imagePath;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SearchPage.routeName,
            arguments: categoryName);
      },
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 48,
            height: 48,
          ),
          const SizedBox(height: 12.0),
          SubtitleWidget(
            label: categoryName,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
