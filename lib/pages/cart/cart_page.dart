import 'package:e_store/pages/cart/bottom_checkout.dart';
import 'package:e_store/pages/cart/cart_widget.dart';
import 'package:e_store/providers/cart_provider.dart';
import 'package:e_store/root_page.dart';
import 'package:e_store/services/app_methods.dart';
import 'package:e_store/services/assets_manager.dart';
import 'package:e_store/widgets/empty_cart_widget.dart';
import 'package:e_store/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final bool isCartEmpty = cartProvider.getCartItems.isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: TitleWidget(
          label: 'Cart (${cartProvider.getCartItems.length})',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RootPage.routeName);
          },
          icon: const Icon(
            IconlyLight.arrowLeft2,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              AppMethods.showMessageDialog(
                context,
                title: 'Clearing Cart!',
                message: 'Are you sure you want to clear your cart?',
                errorMessage: '',
                isError: false,
                fct: () {
                  cartProvider.clearLocalCart();
                  Navigator.pop(context);
                },
              );
            },
            icon: const Icon(
              Icons.delete_forever_rounded,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: isCartEmpty
          ? EmptyCartWidget(
              imagePath: AssetsManager.shoppingBasket,
              title: 'Your cart is empty!',
              subtitle:
                  'It looks like you didn\'t add anything to your cart.\nGo ahead and start shopping now!',
              buttonText: 'Shop Now!',
            )
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView.builder(
                      itemCount: cartProvider.getCartItems.length,
                      itemBuilder: (context, index) {
                        return ChangeNotifierProvider.value(
                          value: cartProvider.getCartItems.values
                              .toList()
                              .reversed
                              .toList()[index],
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: CartWidget(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                const BottomCheckoutWidget(),
              ],
            ),
    );
  }
}
