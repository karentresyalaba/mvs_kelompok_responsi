import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../../providers/keranjang_provider.dart';
import '../product/product_list_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> mainCategories = [
      {'image': 'assets/images/category/category1.png', 'title': 'Child'},
      {'image': 'assets/images/category/category2.png', 'title': 'Men'},
      {'image': 'assets/images/category/category3.png', 'title': 'Women'},
    ];

    final List<Map<String, String>> subCategories = [
      {'image': 'assets/images/products1/products1.png', 'tag': 'Eyeglasses'},
      {'image': 'assets/images/products1/products2.png', 'tag': 'Sunglasses'},
      {'image': 'assets/images/products1/products3.png', 'tag': 'Screen Glasses'},
      {'image': 'assets/images/products1/products4.png', 'tag': 'Contact Lenses'},
      {'image': 'assets/images/products1/products5.png', 'tag': 'Power Sunglasses'},
      {'image': 'assets/images/products1/products6.png', 'tag': 'Progressive Lenses'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: const Color(0xFFECECEC)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Set your wardrobe with our amazing selection!',
              style: TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),

            // Main Categories
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.72,
              ),
              itemCount: mainCategories.length,
              itemBuilder: (ctx, i) {
                return _buildMainCategory(
                  context,
                  mainCategories[i]['image']!,
                  mainCategories[i]['title']!,
                  i,
                );
              },
            ),

            const SizedBox(height: 28),

            const Text(
              'Discover Latest Collection',
              style: TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Sub Categories
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.85,
              ),
              itemCount: subCategories.length,
              itemBuilder: (ctx, i) {
                return _buildSubCategory(
                  context,
                  subCategories[i]['image']!,
                  subCategories[i]['tag']!,
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: _BottomNav(),
    );
  }

  Widget _buildMainCategory(BuildContext context, String image, String title, int index) {
    return _CategoryButton(image: image, title: title, index: index);
  }

  Widget _buildSubCategory(BuildContext context, String image, String tag) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductListScreen(title: tag),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                  // Fallback when asset is missing so UI still shows instead of a blank area
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.image_not_supported,
                    size: 36,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 16),
              alignment: Alignment.center,
              child: Text(
                tag,
                style: const TextStyle(
                  fontFamily: 'TomatoGrotesk',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<KeranjangProvider>().jumlah;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 3, // Category
      onTap: (i) {
        if (i == 3) return; // already here
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Menu index $i belum diimplementasikan')),
        );
      },
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
        const BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
        BottomNavigationBarItem(
          label: '',
          icon: badges.Badge(
            position: badges.BadgePosition.topEnd(top: -8, end: -10),
            badgeStyle: const badges.BadgeStyle(badgeColor: Colors.red),
            badgeContent: Text(
              cartCount.toString(),
              style: const TextStyle(fontFamily: 'TomatoGrotesk', color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
            ),
            child: const Icon(Icons.shopping_cart_outlined),
          ),
        ),
        const BottomNavigationBarItem(icon: Icon(Icons.article_outlined), label: ''),
        const BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
      ],
    );
  }
}

class _CategoryButton extends StatefulWidget {
  final String image;
  final String title;
  final int index;

  const _CategoryButton({required this.image, required this.title, required this.index});

  @override
  State<_CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<_CategoryButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) {
        setState(() => _pressed = false);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ProductListScreen(title: widget.title)),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: widget.index == 2
                      ? const LinearGradient(
                          colors: [Color(0xFFFFE082), Color(0xFFF8BBD0)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  color: widget.index == 0
                      ? const Color(0xFFFF8A80)
                      : (widget.index == 1 ? const Color(0xFFF0F0F0) : null),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                    child: ClipOval(
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const Icon(
                          Icons.image_not_supported,
                          size: 36,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: _pressed ? const Color(0xFFFFD700) : Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: _pressed ? const Color(0xFFFFD700) : const Color(0xFFE6E6E6)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              widget.title,
              style: TextStyle(
                fontFamily: 'TomatoGrotesk',
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: _pressed ? Colors.black : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}