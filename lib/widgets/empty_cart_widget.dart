import 'package:e_store/widgets/subtitle_widget.dart';
import 'package:e_store/root_page.dart';
import 'package:e_store/widgets/button_widget.dart';
import 'package:e_store/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });
  final String imagePath, title, subtitle, buttonText;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: size.height * 0.35,
              width: double.infinity,
            ),
            const TitleWidget(
              label: 'Woops!',
              color: Colors.purple,
              fontSize: 36,
            ),
            const SizedBox(
              height: 24,
            ),
            SubtitleWidget(
              label: title,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            const SizedBox(
              height: 12,
            ),
            SubtitleWidget(
              label: subtitle,
            ),
            const SizedBox(
              height: 36,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: ButtonWidget(
                expanded: true,
                label: 'Shop Now!',
                function: () {
                  Navigator.pushNamed(context, RootPage.routeName);
                },
                icon: Icons.shopping_bag,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
