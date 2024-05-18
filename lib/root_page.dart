import 'package:e_store/pages/cart/cart_page.dart';
import 'package:e_store/pages/home_page.dart';
import 'package:e_store/pages/profile_page.dart';
import 'package:e_store/pages/search_page.dart';
import 'package:e_store/providers/cart_provider.dart';
import 'package:e_store/widgets/badge_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});
  static String routeName = '/RootPage';

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late PageController pageController;
  int currentPage = 0;
  List<Widget> pages = const [
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),
  ];
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        height: kBottomNavigationBarHeight,
        elevation: 0,
        selectedIndex: currentPage,
        onDestinationSelected: (index) {
          setState(
            () {
              currentPage = index;
              pageController.jumpToPage(currentPage);
            },
          );
        },
        destinations:  [
          const NavigationDestination(
            selectedIcon: Icon(IconlyBold.home),
            icon: Icon(IconlyLight.home),
            label: 'Home',
          ),
          const NavigationDestination(
            selectedIcon: Icon(IconlyBold.search),
            icon: Icon(IconlyLight.search),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: const Icon(IconlyBold.bag2),
            icon: BadgeIconWidget(
                label: '${cartProvider.getCartItems.length}',
                icon: IconlyLight.bag2),
            label: 'Cart',
          ),
          const NavigationDestination(
            selectedIcon: Icon(IconlyBold.profile),
            icon: Icon(IconlyLight.profile),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
