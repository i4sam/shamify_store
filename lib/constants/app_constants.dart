import 'package:e_store/models/title_model.dart';
import 'package:e_store/pages/auth/forgot_password.dart';
import 'package:e_store/pages/auth/signin.dart';
import 'package:e_store/pages/auth/signup.dart';
import 'package:e_store/pages/home_page.dart';
import 'package:e_store/pages/inner_pages/orders/orders_page.dart';
import 'package:e_store/pages/inner_pages/product_details_page.dart';
import 'package:e_store/pages/inner_pages/recently_viewed_page.dart';
import 'package:e_store/pages/inner_pages/wishlist_page.dart';
import 'package:e_store/pages/search_page.dart';
import 'package:e_store/providers/cart_provider.dart';
import 'package:e_store/providers/product_provider.dart';
import 'package:e_store/providers/theme_provider.dart';
import 'package:e_store/providers/viewed_product_provider.dart';
import 'package:e_store/providers/wishlist_provider.dart';
import 'package:e_store/root_page.dart';
import 'package:e_store/services/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppConstants {
  static String shoesImage =
      'https://i.ebayimg.com/images/g/NPcAAOSwN7VmIsAy/s-l1600.jpg';

  static List<SingleChildWidget> appProvidersList = [
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => WishlistProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => ViewedProductProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => ProductProvider(),
    ),
  ];
  static final Map<String, WidgetBuilder> appRoutes = {
    RootPage.routeName: (context) => const RootPage(),
    HomePage.routeName: (context) => const HomePage(),
    ProductDetailsPage.routeName: (context) => const ProductDetailsPage(),
    WishlistPage.routeName: (context) => const WishlistPage(),
    RecentlyViewedPage.routeName: (context) => const RecentlyViewedPage(),
    SignIn.routeName: (context) => const SignIn(),
    ForgotPasswordPage.routeName: (context) => const ForgotPasswordPage(),
    SignUp.routeName: (context) => const SignUp(),
    OrdersPage.routeName: (context) => const OrdersPage(),
    SearchPage.routeName: (context) => const SearchPage(),
  };

  static List<String> bannerImages = [
    AssetsManager.banner1,
    AssetsManager.banner2,
  ];

  static List<CategoryModel> appCategories = [
    CategoryModel(
      id: AssetsManager.book,
      name: 'Books',
      image: AssetsManager.book,
    ),
    CategoryModel(
      id: AssetsManager.fashion,
      name: 'Fashion',
      image: AssetsManager.fashion,
    ),
    CategoryModel(
      id: AssetsManager.shoes,
      name: 'Shoes',
      image: AssetsManager.shoes,
    ),
    CategoryModel(
      id: AssetsManager.electronics,
      name: 'Electronics',
      image: AssetsManager.electronics,
    ),
    CategoryModel(
      id: AssetsManager.mobiles,
      name: 'Phones',
      image: AssetsManager.mobiles,
    ),
    CategoryModel(
      id: AssetsManager.pc,
      name: 'Laptops',
      image: AssetsManager.pc,
    ),
    CategoryModel(
      id: AssetsManager.cosmetics,
      name: 'Cosmetics',
      image: AssetsManager.cosmetics,
    ),
    CategoryModel(
      id: AssetsManager.watch,
      name: 'Watch',
      image: AssetsManager.watch,
    ),
  ];
}
