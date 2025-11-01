// lib/screens/home/widgets/product_card.dart
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;

  const ProductCard({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0, // HILANGKAN SHADOW
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Container(
                  height: 140,
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(
                        image,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image, size: 50, color: Colors.grey);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              // LABEL POWERED (jika perlu)
              // Uncomment jika ada produk dengan label
              // Positioned(
              //   top: 8,
              //   left: 8,
              //   child: Container(
              //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              //     decoration: BoxDecoration(
              //       color: Colors.cyan,
              //       borderRadius: BorderRadius.circular(4),
              //     ),
              //     child: const Text(
              //       'POWERED',
              //       style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.favorite_border, size: 18, color: Colors.grey),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Silver Purple Full Rim\nCat Eye',
                  style: TextStyle(
                    fontFamily: 'TomatoGrotesk',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '\$1100',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.star, size: 16, color: Color(0xFFFFA726)),
                        SizedBox(width: 4),
                        Text(
                          '4.8',
                          style: TextStyle(fontFamily: 'TomatoGrotesk', fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}