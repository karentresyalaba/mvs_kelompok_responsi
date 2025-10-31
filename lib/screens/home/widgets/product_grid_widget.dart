import 'package:flutter/material.dart';
import 'product_card_widget.dart';

class ProductGridWidget extends StatelessWidget {
  const ProductGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return const ProductCardWidget(
            imageUrl: 'https://images.unsplash.com/photo-1574258495973-f010dfbb5371?w=300',
            productName: 'Silver Purple Full Rim Cat Eye',
            price: '\$1100',
            rating: 4.8,
          );
        },
      ),
    );
  }
}