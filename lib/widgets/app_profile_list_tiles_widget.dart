import 'package:e_store/pages/auth/signin.dart';
import 'package:e_store/pages/inner_pages/orders/orders_page.dart';
import 'package:e_store/pages/inner_pages/recently_viewed_page.dart';
import 'package:e_store/pages/inner_pages/wishlist_page.dart';
import 'package:e_store/services/app_methods.dart';
import 'package:e_store/services/assets_manager.dart';
import 'package:e_store/widgets/list_tile_widget.dart';
import 'package:e_store/widgets/theme_switch_tile_widget.dart';
import 'package:e_store/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class AppProfileListTilesWidget extends StatelessWidget {
  const AppProfileListTilesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            thickness: 1,
          ),
          const SizedBox(height: 12),
          const TitleWidget(
            label: "General",
            fontSize: 20,
          ),
          ListTileWidget(
            label: 'All Orders',
            function: () async {
              await Navigator.pushNamed(context, OrdersPage.routeName);
            },
            imagePath: AssetsManager.orderSvg,
          ),
          ListTileWidget(
            label: 'Wishlist',
            function: () async {
              await Navigator.pushNamed(context, WishlistPage.routeName);
            },
            imagePath: AssetsManager.wishlistSvg,
          ),
          ListTileWidget(
            label: 'Viewed Recently',
            function: () async {
              await Navigator.pushNamed(context, RecentlyViewedPage.routeName);
            },
            imagePath: AssetsManager.recent,
          ),
          ListTileWidget(
            label: 'Address',
            function: () {},
            imagePath: AssetsManager.address,
          ),
          const SizedBox(height: 12),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(height: 12),
          const TitleWidget(
            label: "Settings",
            fontSize: 20,
          ),
          const ThemeSwitchTileWidget(),
          const SizedBox(height: 12),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(height: 12),
          const TitleWidget(
            label: "Privacy Policy",
            fontSize: 20,
          ),
          ListTileWidget(
            label: 'Privacy Policy',
            function: () {},
            imagePath: AssetsManager.privacy,
          ),
          const SizedBox(height: 12),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(height: 12),
          const TitleWidget(
            label: "Account Settings",
            fontSize: 20,
          ),
          ListTileWidget(
            label: 'Edit Account Settings',
            function: () async {
              await AppMethods.showMessageDialog(
                context,
                title: 'Logout',
                errorMessage: '',
                message: 'Do you want to logout?',
                icon: Icons.settings,
                isError: true,
                fct: () {},
              );
            },
            imagePath: AssetsManager.electronics,
          ),
          ListTileWidget(
            label: 'Log out',
            function: () async {
              await AppMethods.showMessageDialog(
                context,
                errorMessage: 'We\'re sorry there was an error!',
                title: 'Logout',
                message: 'Do you want to logout?',
                icon: Icons.logout,
                isError: true,
                fct: () {},
              );
            },
            imagePath: AssetsManager.login,
          ),
          ListTileWidget(
            label: 'Login',
            function: () async {
              await Navigator.pushNamed(context, SignIn.routeName);
            },
            imagePath: AssetsManager.login,
          ),
        ],
      ),
    );
  }
}
