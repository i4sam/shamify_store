import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_store/pages/cart/bottom_checkout.dart';
import 'package:e_store/providers/viewed_product_provider.dart';
import 'package:e_store/services/app_methods.dart';
import 'package:e_store/services/assets_manager.dart';
import 'package:e_store/widgets/empty_cart_widget.dart';
import 'package:e_store/widgets/product/product_widget.dart';
import 'package:e_store/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class RecentlyViewedPage extends StatefulWidget {
  const RecentlyViewedPage({super.key});
  static const String routeName = "/RecentlyViewedPage";

  @override
  State<RecentlyViewedPage> createState() => _RecentlyViewedPageState();
}

class _RecentlyViewedPageState extends State<RecentlyViewedPage> {
  @override
  Widget build(BuildContext context) {
    final viewedProductProvider = Provider.of<ViewedProductProvider>(context);
    final bool isViewedHistoryEmpty =
        viewedProductProvider.getViewedProductItems.isEmpty;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: TitleWidget(
            label:
                'Viewed History (${viewedProductProvider.getViewedProductItems.length})',
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            IconlyLight.arrowLeft2,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                AppMethods.showMessageDialog(
                  context,
                  title: 'Clearing History!',
                  message: 'Are you sure you want to clear your history?',
                  errorMessage: '',
                  isError: false,
                  fct: () {
                    viewedProductProvider.clearViewedHistory();
                    Navigator.pop(context);
                  },
                );
              },
              icon: const Icon(
                Icons.delete_forever_rounded,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      body: isViewedHistoryEmpty
          ? EmptyCartWidget(
              imagePath: AssetsManager.shoppingBasket,
              title: 'Nothing to display',
              subtitle:
                  'It looks like you have not viewed any products yet!\nGo ahead and start shopping now!',
              buttonText: 'Shop Now!',
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(
                    child: DynamicHeightGridView(
                      itemCount:
                          viewedProductProvider.getViewedProductItems.length,
                      builder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductWidget(
                            productId: viewedProductProvider
                                .getViewedProductItems.values
                                .toList()[index]
                                .productId,
                          ),
                        );
                      },
                      crossAxisCount: 2,
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  const BottomCheckoutWidget(),
                ],
              ),
            ),
    );
  }
}
