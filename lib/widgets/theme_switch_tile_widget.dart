import 'package:e_store/providers/theme_provider.dart';
import 'package:e_store/services/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitchTileWidget extends StatelessWidget {
  const ThemeSwitchTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SwitchListTile(
      secondary: Image.asset(
        AssetsManager.theme,
        height: 36,
      ),
      title: Text(themeProvider.isDarkTheme ? "Dark Theme" : "Light Theme"),
      value: themeProvider.isDarkTheme,
      onChanged: (value) {
        themeProvider.setDarkTheme(themeValue: value);
      },
    );
  }
}
