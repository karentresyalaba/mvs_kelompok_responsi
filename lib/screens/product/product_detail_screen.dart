import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../../providers/keranjang_provider.dart';

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
    'assets/images/product/product2/products1.png',
    'assets/images/product/product2/products2.png',
    'assets/images/product/product2/products3.png',
  ];

  final List<Color> _colors = [
    const Color(0xFFD4A574),
    const Color(0xFF2196F3),
    const Color(0xFF8B4513),
    const Color(0xFF757575),
    const Color(0xFF9C27B0),
    const Color(0xFF4CAF50),
  ];

  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<KeranjangProvider>().jumlah;
    final originalPrice = widget.product['price'] as int;
    final discountedPrice = (originalPrice * 0.87).round();
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Product Details',
          style: TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -8, end: -10),
              badgeStyle: const badges.BadgeStyle(badgeColor: Colors.red),
              badgeContent: Text(
                cartCount.toString(),
                style: const TextStyle(fontFamily: 'TomatoGrotesk', color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
              ),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Product Image
            Container(
              height: 300,
              width: double.infinity,
              color: const Color(0xFFF8F8F8),
              alignment: Alignment.center,
              child: Image.asset(
                _productImages[_selectedImageIndex],
                fit: BoxFit.contain,
                height: 280,
              ),
            ),

            // Product Variations/Thumbnails
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _productImages.length,
                itemBuilder: (ctx, i) {
                  final isSelected = i == _selectedImageIndex;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedImageIndex = i),
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? const Color(0xFFFFA500) : Colors.grey.shade300,
                          width: isSelected ? 3 : 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          _productImages[i],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Product Information
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category and Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Thivi Blouse',
                        style: TextStyle(
                          fontFamily: 'TomatoGrotesk',
                          color: Colors.red.shade700,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 16, color: Colors.amber),
                          const SizedBox(width: 4),
                          const Text(
                            '4.5',
                            style: TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '(470)',
                            style: TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 14, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Product Name
                  Text(
                    widget.product['name'] as String,
                    style: const TextStyle(
                      fontFamily: 'TomatoGrotesk',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Price
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Price: ',
                        style: TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        '\$$discountedPrice',
                        style: const TextStyle(
                          fontFamily: 'TomatoGrotesk',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF1144),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '\$$originalPrice',
                        style: TextStyle(
                          fontFamily: 'TomatoGrotesk',
                          fontSize: 16,
                          color: Colors.grey.shade400,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Quantity
                  const Text(
                    'Quantity:',
                    style: TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.remove, size: 20),
                          onPressed: () {
                            if (_quantity > 1) {
                              setState(() => _quantity--);
                            }
                          },
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 40,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          _quantity.toString(),
                          style: const TextStyle(
                            fontFamily: 'TomatoGrotesk',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.add, size: 20),
                          onPressed: () => setState(() => _quantity++),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Color Options
                  const Text(
                    'Items Color:',
                    style: TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: List.generate(_colors.length, (i) {
                      final isSelected = i == _selectedColorIndex;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedColorIndex = i),
                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: _colors[i],
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? const Color(0xFFFF1144) : Colors.grey.shade300,
                              width: isSelected ? 3 : 2,
                            ),
                          ),
                          child: isSelected
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 20,
                                )
                              : null,
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 24),

                  // Description
                  const Text(
                    'Description:',
                    style: TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humor.',
                    style: TextStyle(
                      fontFamily: 'TomatoGrotesk',
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 100), // Space for button
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                final provider = Provider.of<KeranjangProvider>(context, listen: false);
                provider.tambah();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Product added to cart')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFA500),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart, color: Colors.black),
                  SizedBox(width: 8),
                  Text(
                    'Add To Cart',
                    style: TextStyle(
                      fontFamily: 'TomatoGrotesk',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

