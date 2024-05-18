import 'package:e_store/models/product_model.dart';
import 'package:e_store/pages/inner_pages/product_details_page.dart';
import 'package:e_store/providers/viewed_product_provider.dart';
import 'package:e_store/widgets/image_loader.dart';
import 'package:e_store/widgets/product/favorite_button_widget.dart';
import 'package:e_store/widgets/subtitle_widget.dart';
import 'package:e_store/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LatestArrival extends StatelessWidget {
  const LatestArrival({super.key});

  @override
  Widget build(BuildContext context) {
    final productsModel = Provider.of<ProductModel>(context);
    final viewedProductProvider = Provider.of<ViewedProductProvider>(context);
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        viewedProductProvider.addProductToHistory(
            productId: productsModel.productId);
        Navigator.pushNamed(context, ProductDetailsPage.routeName,
            arguments: productsModel.productId);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: SizedBox(
          width: size.width * 0.7,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageLoader(
                imagePath: productsModel.productImage,
                width: size.width * 0.28,
                height: size.width * 0.28,
              ),
              const SizedBox(
                width: 12,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWidget(
                      fontSize: 16,
                      label: productsModel.productTitle,
                      maxLines: 2,
                    ),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FavoriteButtonWidget(
                            productId: productsModel.productId,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add_shopping_cart_rounded),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SubtitleWidget(
                        label: '${productsModel.productPrice}\$',
                        color: Colors.blue,
                      ),
                    )
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
