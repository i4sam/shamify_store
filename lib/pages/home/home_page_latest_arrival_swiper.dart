import 'package:e_store/providers/product_provider.dart';
import 'package:e_store/widgets/product/latest_arrival.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageLatestArrivalSwiper extends StatelessWidget {
  const HomePageLatestArrivalSwiper({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductProvider>(context);

    return SizedBox(
      height: size.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: productsProvider.getProducts[index],
            child: const LatestArrival()),
      ),
    );
  }
}
