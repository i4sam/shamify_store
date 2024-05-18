import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_store/models/product_model.dart';
import 'package:e_store/pages/auth/text_form_field_widget.dart';
import 'package:e_store/providers/product_provider.dart';
import 'package:e_store/services/assets_manager.dart';
import 'package:e_store/widgets/product/product_widget.dart';
import 'package:e_store/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  static String routeName = "/SearchPage";
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _searchTextController;
  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  List<ProductModel> productSearchList = [];
  @override
  Widget build(BuildContext context) {
    bool isSearchFieldNotEmpty = _searchTextController.text.isNotEmpty;
    final productProvider = Provider.of<ProductProvider>(context);
    final String? passedCategory =
        ModalRoute.of(context)!.settings.arguments as String?;
    final List<ProductModel> productsList = passedCategory == null
        ? productProvider.getProducts
        : productProvider.findProductByCategory(cagegory: passedCategory);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.red,
              ),
            )
          ],
          title: Center(
            child: TitleWidget(
              label: passedCategory ?? 'Search',
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Image.asset(
              AssetsManager.shoppingCart,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextFormFieldWidget(
                obscureText: false,
                label: 'Search',
                prefixIcon: Icons.search,
                suffixIcon: const Icon(
                  
                  Icons.clear,
                ),
                controller: _searchTextController,
                onChanged: (value) {
                  setState(() {
                    productSearchList = productProvider.searchQuery(
                      passedList: productsList,
                      searchText: _searchTextController.text,
                    );
                  });
                },
                onFieldSubmitted: (value) {
                  setState(() {
                    productSearchList = productProvider.searchQuery(
                      passedList: productsList,
                      searchText: _searchTextController.text,
                    );
                  });
                },
              ),
              const SizedBox(
                height: 12,
              ),
              if (isSearchFieldNotEmpty && productSearchList.isEmpty) ...[
                const Center(
                  child: TitleWidget(
                    label: 'No results found!!',
                  ),
                )
              ],
              Expanded(
                child: DynamicHeightGridView(
                  itemCount: isSearchFieldNotEmpty
                      ? productSearchList.length
                      : productsList.length,
                  builder: (context, index) {
                    return ProductWidget(
                      productId: isSearchFieldNotEmpty
                          ? productSearchList[index].productId
                          : productsList[index].productId,
                    );
                  },
                  crossAxisCount: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
