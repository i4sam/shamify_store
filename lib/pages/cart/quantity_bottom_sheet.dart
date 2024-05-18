import 'package:e_store/models/cart_model.dart';
import 'package:e_store/providers/cart_provider.dart';
import 'package:e_store/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuantityBottomSheetWidget extends StatelessWidget {
  const QuantityBottomSheetWidget({super.key, required this.cardModel});
  final CartModel cardModel;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 12,
            decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(16)),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 25,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      cartProvider.updateQuantity(
                        productId: cardModel.productId,
                        quantity: index + 1,
                      );
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: SubtitleWidget(
                          label: (index + 1).toString(),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
