// lib/screens/product/product_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../../providers/keranjang_provider.dart';
import 'package:eyewear_shop/screens/profile/track_order_page.dart' hide ReviewsPage;

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _selectedImageIndex = 0;
  int _quantity = 1;
  int _selectedColorIndex = 0;

  final List<String> _productImages = [
    'assets/images/product9.png',
    'assets/images/product5.png',
    'assets/images/product2.png',
  ];

  final List<Color> _colors = [
    const Color(0xFF2196F3), // Blue
    const Color(0xFF795548), // Brown
    const Color(0xFF9C27B0), // Purple
    const Color(0xFF4CAF50), // Green
  ];

  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<KeranjangProvider>().jumlah;
    final originalPrice = widget.product['price'] as int? ?? 340; // Default to 340 to match screenshot
    final discountedPrice = 270; // Hardcoded to match screenshot; or calculate if dynamic, e.g., (originalPrice * 0.794).round()

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Product Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: badges.Badge(
              badgeContent: Text(cartCount.toString(), style: const TextStyle(color: Colors.white, fontSize: 10)),
              badgeStyle: const badges.BadgeStyle(badgeColor: Colors.red),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Image
            Container(
              height: 320,
              width: double.infinity,
              color: Colors.grey[50],
              padding: const EdgeInsets.all(32),
              child: Image.asset(
                _productImages[_selectedImageIndex],
                fit: BoxFit.contain,
              ),
            ),

            // Thumbnails
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _productImages.length,
                itemBuilder: (ctx, i) {
                  return GestureDetector(
                    onTap: () => setState(() => _selectedImageIndex = i),
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: i == _selectedImageIndex ? Colors.orange : Colors.grey.shade300,
                          width: i == _selectedImageIndex ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(_productImages[i], fit: BoxFit.cover),
                      ),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category
                  Text(
                    'Thivi Blouse',
                    style: TextStyle(color: Colors.red.shade700, fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),

                  // Name + Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.product['name'],
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const SizedBox(width: 4),
                          const Text('4.5', style: TextStyle(fontWeight: FontWeight.w600)),
                          Text(' (470)', style: TextStyle(color: Colors.grey[600])),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Price
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$$discountedPrice',
                        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '\$$originalPrice',
                        style: TextStyle(fontSize: 18, color: Colors.grey.shade500, decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Quantity
                  const Text('Quantity:', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _quantityButton(Icons.remove, () => setState(() => _quantity = _quantity > 1 ? _quantity - 1 : 1)),
                      Container(
                        width: 50,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
                        child: Text(_quantity.toString(), style: const TextStyle(fontWeight: FontWeight.w600)),
                      ),
                      _quantityButton(Icons.add, () => setState(() => _quantity++)),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Colors
                  const Text('Items Color:', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 12),
                  Row(
                    children: _colors.asMap().entries.map((e) {
                      int i = e.key;
                      Color color = e.value;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedColorIndex = i),
                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(color: i == _selectedColorIndex ? Colors.orange : Colors.grey.shade300, width: 2),
                          ),
                          child: i == _selectedColorIndex ? const Icon(Icons.check, color: Colors.white, size: 18) : null,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),

                  // Description
                  const Text('Description:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humor.',
                    style: TextStyle(color: Colors.grey[700], height: 1.5),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)]),
        child: ElevatedButton(
          onPressed: () {
            context.read<KeranjangProvider>().tambah();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to cart!')));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFDD096),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
            minimumSize: const Size.fromHeight(52),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart, color: Colors.black),
              SizedBox(width: 8),
              Text('Add To Cart', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _quantityButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(8)),
        child: Icon(icon, size: 18),
      ),
    );
  }
}