<<<<<<< HEAD
=======
// lib/screens/product/product_detail_screen.dart
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../../providers/keranjang_provider.dart';
<<<<<<< HEAD
=======
import 'package:eyewear_shop/screens/profile/track_order_page.dart' hide ReviewsPage;
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336

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
<<<<<<< HEAD
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
=======
    'assets/images/product9.png',
    'assets/images/product5.png',
    'assets/images/product2.png',
  ];

  final List<Color> _colors = [
    const Color(0xFF2196F3), // Blue
    const Color(0xFF795548), // Brown
    const Color(0xFF9C27B0), // Purple
    const Color(0xFF4CAF50), // Green
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
  ];

  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<KeranjangProvider>().jumlah;
<<<<<<< HEAD
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
=======
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
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: badges.Badge(
<<<<<<< HEAD
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
=======
              badgeContent: Text(cartCount.toString(), style: const TextStyle(color: Colors.white, fontSize: 10)),
              badgeStyle: const badges.BadgeStyle(badgeColor: Colors.red),
              child: const Icon(Icons.shopping_cart_outlined),
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
<<<<<<< HEAD
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
=======
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
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                  return GestureDetector(
                    onTap: () => setState(() => _selectedImageIndex = i),
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
<<<<<<< HEAD
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? const Color(0xFFFFA500) : Colors.grey.shade300,
                          width: isSelected ? 3 : 1,
=======
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: i == _selectedImageIndex ? Colors.orange : Colors.grey.shade300,
                          width: i == _selectedImageIndex ? 2 : 1,
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
<<<<<<< HEAD
                        child: Image.asset(
                          _productImages[i],
                          fit: BoxFit.cover,
                        ),
=======
                        child: Image.asset(_productImages[i], fit: BoxFit.cover),
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                      ),
                    ),
                  );
                },
              ),
            ),

<<<<<<< HEAD
            // Product Information
=======
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
<<<<<<< HEAD
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
=======
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
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                        ),
                      ),
                      Row(
                        children: [
<<<<<<< HEAD
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
=======
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const SizedBox(width: 4),
                          const Text('4.5', style: TextStyle(fontWeight: FontWeight.w600)),
                          Text(' (470)', style: TextStyle(color: Colors.grey[600])),
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                        ],
                      ),
                    ],
                  ),
<<<<<<< HEAD
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
=======
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                  const SizedBox(height: 16),

                  // Price
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
<<<<<<< HEAD
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
=======
                      Text(
                        '\$$discountedPrice',
                        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.red),
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '\$$originalPrice',
<<<<<<< HEAD
                        style: TextStyle(
                          fontFamily: 'TomatoGrotesk',
                          fontSize: 16,
                          color: Colors.grey.shade400,
                          decoration: TextDecoration.lineThrough,
                        ),
=======
                        style: TextStyle(fontSize: 18, color: Colors.grey.shade500, decoration: TextDecoration.lineThrough),
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Quantity
<<<<<<< HEAD
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
=======
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
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                    ],
                  ),
                  const SizedBox(height: 20),

<<<<<<< HEAD
                  // Color Options
                  const Text(
                    'Items Color:',
                    style: TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: List.generate(_colors.length, (i) {
                      final isSelected = i == _selectedColorIndex;
=======
                  // Colors
                  const Text('Items Color:', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 12),
                  Row(
                    children: _colors.asMap().entries.map((e) {
                      int i = e.key;
                      Color color = e.value;
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                      return GestureDetector(
                        onTap: () => setState(() => _selectedColorIndex = i),
                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
<<<<<<< HEAD
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
=======
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
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                  ),
                  const SizedBox(height: 24),

                  // Description
<<<<<<< HEAD
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
=======
                  const Text('Description:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humor.',
                    style: TextStyle(color: Colors.grey[700], height: 1.5),
                  ),
                  const SizedBox(height: 100),
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                ],
              ),
            ),
          ],
        ),
      ),
<<<<<<< HEAD
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
=======
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
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
          ),
        ),
      ),
    );
  }
<<<<<<< HEAD
}

=======

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
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
