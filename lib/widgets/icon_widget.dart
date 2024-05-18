import 'package:flutter/material.dart';
import 'package:e_store/styles/app_colors.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    required this.icon,
    required this.function,
  });

  final IconData icon;
  final Function function;

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    Color iconColor = Theme.of(context).scaffoldBackgroundColor;
    Color? iconBackgroundColor;
    if (isDarkTheme) {
      iconBackgroundColor = AppColors.lightBackgroundColor;
    } else {
      iconBackgroundColor = AppColors.darkBackgroundColor;
    }

    return Material(
      borderRadius: BorderRadius.circular(12),
      color: iconBackgroundColor,
      child: InkWell(
        splashColor: Colors.red,
        borderRadius: BorderRadius.circular(12),
        onTap: () => function(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            color: iconColor,
            size: 20,
            icon,
          ),
        ),
      ),
    );
  }
}
