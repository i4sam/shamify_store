import 'package:e_store/models/cart_model.dart';
import 'package:e_store/pages/cart/quantity_bottom_sheet.dart';
import 'package:e_store/providers/cart_provider.dart';
import 'package:e_store/providers/product_provider.dart';
import 'package:e_store/widgets/image_loader.dart';
import 'package:e_store/widgets/product/favorite_button_widget.dart';
import 'package:e_store/widgets/subtitle_widget.dart';
import 'package:e_store/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartModelProvider = Provider.of<CartModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final getCurrentProduct =
        productProvider.findProductById(cartModelProvider.productId);
    Size size = MediaQuery.of(context).size;
    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : FittedBox(
            child: IntrinsicWidth(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    ImageLoader(
                      imagePath: getCurrentProduct.productImage,
                      width: MediaQuery.of(context).size.height * 0.2,
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    const SizedBox(width: 12),
                    IntrinsicWidth(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.6,
                                child: TitleWidget(
                                  label: getCurrentProduct.productTitle,
                                  maxLines: 2,
                                ),
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      cartProvider.removeProductFromCart(
                                        productId: getCurrentProduct.productId,
                                      );
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                  FavoriteButtonWidget(
                                    productId: getCurrentProduct.productId,
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SubtitleWidget(
                                fontSize: 18,
                                label:
                                    'price : ${getCurrentProduct.productPrice}\$',
                                color: Colors.blue,
                              ),
                              const Spacer(),
                              OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 2, color: Colors.blue)),
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    context: context,
                                    builder: (context) =>
                                        QuantityBottomSheetWidget(
                                      cardModel: cartModelProvider,
                                    ),
                                  );
                                },
                                icon: const Icon(IconlyLight.arrowDown2),
                                label:
                                    Text('Qty : ${cartModelProvider.quantity}'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
