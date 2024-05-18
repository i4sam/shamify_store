import 'package:e_store/providers/cart_provider.dart';
import 'package:e_store/providers/product_provider.dart';
import 'package:e_store/widgets/app_name_text_widget.dart';
import 'package:e_store/widgets/badge_icon_widget.dart';
import 'package:e_store/widgets/description_widget.dart';
import 'package:e_store/widgets/product/favorite_button_widget.dart';
import 'package:e_store/widgets/product/rating_row_widget.dart';
import 'package:e_store/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/product/right_left_text_row_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  static const String routeName = "/ProductDetailsPage";

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentProduct = productProvider.findProductById(productId);
    final cartProvider = Provider.of<CartProvider>(context);
    final isProductInCart =
        cartProvider.isProductInCart(productId: getCurrentProduct!.productId);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: BadgeIconWidget(label: '9', icon: IconlyLight.bag2)),
        ],
        title: const Center(
          child: AppNameTextWidget(),
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
      // ignore: unnecessary_null_comparison
      body: getCurrentProduct == null
          ? const SizedBox
              .shrink() //it can not be null because user has reached it already but I did this for a cleaner code
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    getCurrentProduct.productImage,
                    width: size.width,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleWidget(
                          maxLines: 3,
                          label: getCurrentProduct.productTitle,
                        ),
                        TitleWidget(
                          color: Colors.blue,
                          label: 'price : ${getCurrentProduct.productPrice}\$',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // IconWidget(
                        //   icon: isProductInCart
                        //       ? Icons.check
                        //       : Icons.add_shopping_cart_rounded,
                        //   function: () {},
                        // ),
                        FavoriteButtonWidget(
                          productId: getCurrentProduct.productId,
                        ),
                        const SizedBox(width: 12),
                        ButtonWidget(
                          width: 300,
                          label: isProductInCart
                              ? 'Item was added to cart'
                              : 'Add item to cart',
                          expanded: false,
                          icon: Icons.done_all_outlined,
                          function: () {
                            if (isProductInCart) {
                              return;
                            }
                            cartProvider.addProductToCart(
                                productId: getCurrentProduct.productId);
                          },
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Divider(),
                  ),
                  RightLeftTextRowWidget(
                    rightText: 'In ${getCurrentProduct.productCategory}',
                    leftText: 'About this product',
                    rightTextColor: Colors.grey[600],
                  ),
                  DescriptionWidget(
                    description:
                        'About this product : ${getCurrentProduct.productDescription}',
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Divider(),
                  ),
                  const RightLeftTextRowWidget(
                      rightText: '', leftText: 'App Rating'),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: RatingRowWidget(),
                  ),
                ],
              ),
            ),
    );
  }
}
