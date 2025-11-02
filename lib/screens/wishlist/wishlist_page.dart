// lib/screens/wishlist/wishlist_page.dart
import 'package:flutter/material.dart';
import '../cart/cart_page.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  int _currentIndex = 2; // Index 2 untuk Wishlist
  String selectedCategory = 'All';

  List<Map<String, dynamic>> products = [
    {
      'image': 'assets/images/product1.png',
      'title': 'Silver Purple Full Rim Cat Eye',
      'price': 1100,
      'rating': 4.8,
      'isPowered': false
    },
    {
      'image': 'assets/images/product2.png',
      'title': 'Silver Purple Full Rim Cat Eye',
      'price': 1100,
      'rating': 4.8,
      'isPowered': false
    },
    {
      'image': 'assets/images/product3.png',
      'title': 'Silver Purple Full Rim Cat Eye',
      'price': 1100,
      'rating': 4.8,
      'isPowered': true
    },
    {
      'image': 'assets/images/product4.png',
      'title': 'Silver Purple Full Rim Cat Eye',
      'price': 1100,
      'rating': 4.8,
      'isPowered': true
    },
    {
      'image': 'assets/images/product5.png',
      'title': 'Silver Purple Full Rim Cat Eye',
      'price': 1100,
      'rating': 4.8,
      'isPowered': false
    },
    {
      'image': 'assets/images/product6.png',
      'title': 'Silver Purple Full Rim Cat Eye',
      'price': 1100,
      'rating': 4.8,
      'isPowered': true
    },
    {
      'image': 'assets/images/product7.png',
      'title': 'Silver Purple Full Rim Cat Eye',
      'price': 1100,
      'rating': 4.8,
      'isPowered': false
    },
    {
      'image': 'assets/images/product8.png',
      'title': 'Silver Purple Full Rim Cat Eye',
      'price': 1100,
      'rating': 4.8,
      'isPowered': false
    },
  ];

  void _removeFromWishlist(int index) {
    setState(() {
      products.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Removed from wishlist'),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }

  int get totalPrice {
    return products.fold(0, (sum, product) => sum + (product['price'] as int));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 16,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Wishlist',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'TomatoGrotesk',
              ),
            ),
            Row(
              children: [
                Text(
                  '${products.length} Items',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'TomatoGrotesk',
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(
                  Icons.fiber_manual_record,
                  color: Colors.black87,
                  size: 6,
                ),
                const SizedBox(width: 6),
                const Text(
                  'Total: ',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'TomatoGrotesk',
                  ),
                ),
                Text(
                  '\$$totalPrice',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'TomatoGrotesk',
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey[200]!, width: 1),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryButton('All'),
                  const SizedBox(width: 12),
                  _buildCategoryButton('Child'),
                  const SizedBox(width: 12),
                  _buildCategoryButton('Men'),
                  const SizedBox(width: 12),
                  _buildCategoryButton('Women'),
                  const SizedBox(width: 12),
                  _buildCategoryButton('Dress'),
                  const SizedBox(width: 12),
                  _buildCategoryButton('unisex'),
                ],
              ),
            ),
          ),
          Expanded(
            child: products.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your wishlist is empty',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontFamily: 'TomatoGrotesk',
                    ),
                  ),
                ],
              ),
            )
                : GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade200),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Center(
                                  child: Image.asset(
                                    product['image'],
                                    fit: BoxFit.contain,
                                    width: double.infinity,
                                    height: double.infinity,
                                    errorBuilder:
                                        (context, error, stackTrace) {
                                      return Icon(
                                        Icons.image_not_supported,
                                        color: Colors.grey[400],
                                        size: 50,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(12, 0, 12, 12),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product['title'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    height: 1.3,
                                    fontFamily: 'TomatoGrotesk',
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${product['price']}',
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        fontFamily: 'TomatoGrotesk',
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${product['rating']}',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'TomatoGrotesk',
                                          ),
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
                      if (product['isPowered'] == true)
                        Positioned(
                          top: 12,
                          left: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'POWERED',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () => _removeFromWishlist(index),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFFFFA726),
        unselectedItemColor: Colors.black54,
        backgroundColor: Colors.white,
        elevation: 8,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 3) {
            // Index 3 untuk Cart
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartPage()),
            );
          }
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 28),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined, size: 28),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 28),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_cart_outlined, size: 28),
                Positioned(
                  right: -8,
                  top: -8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: const Text(
                      '14',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.receipt_outlined, size: 28),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 28),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String label) {
    final isSelected = selectedCategory == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFA726) : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color:
            isSelected ? const Color(0xFFFFA726) : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            fontSize: 16,
            fontFamily: 'TomatoGrotesk',
          ),
        ),
      ),
    );
  }
}