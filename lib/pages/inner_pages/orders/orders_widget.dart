import 'package:e_store/widgets/image_loader.dart';
import 'package:e_store/widgets/subtitle_widget.dart';
import 'package:e_store/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FittedBox(
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ImageLoader(
                imagePath:
                    'https://i.ibb.co/BtMBSgK/1-iphone14-128gb-black.webp',
                width: MediaQuery.of(context).size.height * 0.2,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              const SizedBox(width: 12),
              IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 0.6,
                      child: const TitleWidget(
                        label: 'Black Italian Shoes',
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      children: [
                        SubtitleWidget(
                          fontSize: 18,
                          label: 'Price : ',
                        ),
                        SubtitleWidget(
                          fontSize: 18,
                          label: '16\$',
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      children: [
                        SubtitleWidget(
                          fontSize: 18,
                          label: 'Quantity : ',
                        ),
                        SubtitleWidget(
                          fontSize: 18,
                          label: '9',
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.clear),
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
