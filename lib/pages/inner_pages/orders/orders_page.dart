import 'package:e_store/pages/cart/bottom_checkout.dart';
import 'package:e_store/pages/inner_pages/orders/orders_widget.dart';
import 'package:e_store/services/assets_manager.dart';
import 'package:e_store/widgets/empty_cart_widget.dart';
import 'package:e_store/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({
    super.key,
  });
  static String routeName = '/OrdersPage';
  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: EmptyCartWidget(
              imagePath: AssetsManager.emptySearch,
              title: 'No Orders Yet!',
              subtitle:
                  'It seems you haven\'t placed any orders yet.\nBrowse our products and start shopping now!',
              buttonText: 'Shop Now',
            ),
          )
        : Scaffold(
            bottomSheet: const BottomCheckoutWidget(),
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    // Handle clearing orders
                  },
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                  ),
                )
              ],
              title: const TitleWidget(
                label: 'Your Orders (5)',
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  IconlyLight.arrowLeft2,
                ),
              ),
            ),
            body: ListView.separated(
              itemCount: 15,
              itemBuilder: (context, index) {
                return const OrdersWidget();
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
          );
  }
}
