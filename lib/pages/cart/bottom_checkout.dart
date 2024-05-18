import 'package:e_store/providers/cart_provider.dart';
import 'package:e_store/providers/product_provider.dart';
import 'package:e_store/widgets/normal_button_widget.dart';
import 'package:e_store/widgets/subtitle_widget.dart';
import 'package:e_store/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomCheckoutWidget extends StatelessWidget {
  const BottomCheckoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(
            top: BorderSide(
          color: Colors.grey,
        )),
      ),
      child: SizedBox(
        height: kBottomNavigationBarHeight + 16,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWidget(
                    fontSize: 20,
                    label:
                        'Total (${cartProvider.getCartItems.length} products/${cartProvider.getQuantity()} Items)',
                  ),
                  SubtitleWidget(
                    label:
                        '${cartProvider.getTotalPrice(productProvider: productProvider)}\$',
                    color: Colors.blue,
                  ),
                ],
              ),
              const SizedBox(width: 24),
              NormalButtonWidget(
                label: 'check',
                function: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
