import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'widgets/banner_carousel.dart';
import 'widgets/category_grid.dart';
import 'widgets/product_card.dart';
import 'widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Product> products = [
    Product(image: 'assets/images/product1.png', title: 'Silver Purple Full Rim Cat Eye', price: 1100, rating: 4.8, isPowered: true),
    Product(image: 'assets/images/product2.png', title: 'Silver Purple Full Rim Cat Eye', price: 1100, rating: 4.8),
    Product(image: 'assets/images/product3.png', title: 'Silver Purple Full Rim Cat Eye', price: 1100, rating: 4.8, isPowered: true),
    Product(image: 'assets/images/product4.png', title: 'Silver Purple Full Rim Cat Eye', price: 1100, rating: 4.8),
    Product(image: 'assets/images/product5.png', title: 'Silver Purple Full Rim Cat Eye', price: 1100, rating: 4.8, isPowered: true),
    Product(image: 'assets/images/product6.png', title: 'Silver Purple Full Rim Cat Eye', price: 1100, rating: 4.8),
    Product(image: 'assets/images/product7.png', title: 'Silver Purple Full Rim Cat Eye', price: 1100, rating: 4.8, isPowered: true),
    Product(image: 'assets/images/product8.png', title: 'Silver Purple Full Rim Cat Eye', price: 1100, rating: 4.8),
    Product(image: 'assets/images/product9.png', title: 'Silver Purple Full Rim Cat Eye', price: 1100, rating: 4.8, isPowered: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        title: const Icon(Icons.remove_red_eye_outlined, size: 32),
        centerTitle: true,
        actions: [IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {})],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Something...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.tune),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(height: 16),

            // Banner
            const BannerCarousel(),
            const SizedBox(height: 24),

            // Let's Get Started
            const Text(
              "Let's Get Started!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'TomatoGrotesk'),
            ),
            const SizedBox(height: 12),

            // Categories
            const CategoryGrid(),
            const SizedBox(height: 24),

            // Recommended
            const SectionHeader(title: "Recommended for You"),
            const SizedBox(height: 12),

            // Product Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                  onFavorite: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${products[index].title} ditambahkan ke favorit')),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorite'),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart_outlined),
                Positioned(
                  right: -2,
                  top: -2,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text('14', style: TextStyle(fontSize: 10, color: Colors.white)),
                  ),
                ),
              ],
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}