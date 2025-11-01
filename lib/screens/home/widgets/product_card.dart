import 'package:flutter/material.dart';
import '../../../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onFavorite;

  const ProductCard({super.key, required this.product, this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // POWERED Badge
            if (product.isPowered)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.cyan[50],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'POWERED',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.cyan,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'TomatoGrotesk',
                  ),
                ),
              ),
            const SizedBox(height: 8),

            // Favorite Icon
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.favorite_border, size: 20),
                onPressed: onFavorite,
              ),
            ),

            // Product Image
            Center(
              child: Image.asset(
                product.image,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 12),

            // Title
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 12,
                height: 1.3,
                fontFamily: 'TomatoGrotesk',
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),

            // Price & Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product.price.toStringAsFixed(0)}',
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: 'TomatoGrotesk',
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.orange),
                    const SizedBox(width: 4),
                    Text(
                      product.rating.toString(),
                      style: const TextStyle(fontSize: 12, fontFamily: 'TomatoGrotesk'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}