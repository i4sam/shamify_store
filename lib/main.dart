import 'package:e_store/constants/app_constants.dart';
import 'package:e_store/root_page.dart';
import 'package:e_store/providers/theme_provider.dart';
import 'package:e_store/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppConstants.appProvidersList,
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.themeData(
              isDarkTheme: themeProvider.isDarkTheme, context: context),
          home: const RootPage(),
          routes: AppConstants.appRoutes,
        );
      }),
    );
  }
}
