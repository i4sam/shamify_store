// import 'package:e_store/providers/theme_provider.dart';
import 'package:e_store/constants/app_constants.dart';
import 'package:e_store/services/assets_manager.dart';
import 'package:e_store/widgets/app_name_text_widget.dart';
import 'package:e_store/widgets/product/category_rounded_widget.dart';
import 'package:e_store/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'home/home_page_latest_arrival_swiper.dart';
import 'home/home_page_top_swiper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String routeName = '/HomePage';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Image.asset(
            AssetsManager.shoppingCart,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomePageTopSwiper(size: size),
              const SizedBox(height: 12),
              const TitleWidget(label: "Latest Arrivals"),
              const SizedBox(height: 12),
              HomePageLatestArrivalSwiper(size: size),
              const TitleWidget(label: "Categories"),
              const SizedBox(height: 12),
              GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                      AppConstants.appCategories.length,
                      (index) => CategoryRoundedWidget(
                          imagePath: AppConstants.appCategories[index].image,
                          categoryName:
                              AppConstants.appCategories[index].name))),
            ],
          ),
        ),
      ),
    );
  }
}
