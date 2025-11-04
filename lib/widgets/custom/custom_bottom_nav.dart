<<<<<<< HEAD
// lib/widgets/custom/custom_bottom_nav.dart
import 'package:flutter/material.dart';

// Import semua halaman yang akan dipanggil
// SESUAIKAN PATH INI DENGAN STRUKTUR FOLDER ANDA!
import '../../screens/home/home_page.dart';
import '../../screens/category/category_screen.dart';
=======
import 'package:flutter/material.dart';
import '../../screens/home/home_page.dart';
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
import '../../screens/wishlist/wishlist_page.dart';
import '../../screens/cart/cart_page.dart';
import '../../screens/orders/orders_page.dart';
import '../../screens/profile/profile_page.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
<<<<<<< HEAD
  final ValueChanged<int>? onTap;
=======
  final ValueChanged<int> onTap;
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336

  const CustomBottomNav({
    Key? key,
    required this.currentIndex,
<<<<<<< HEAD
    this.onTap, // TIDAK ADA 'required' karena sudah opsional dengan tanda '?'
  }) : super(key: key);

  // Method untuk navigasi ke halaman
  void _navigateToPage(BuildContext context, int index) {
    // Jangan navigasi kalau sudah di halaman yang sama
    if (currentIndex == index) return;

    Widget page;
    
    switch (index) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = const CategoryScreen();
        break;
      case 2:
        page = WishlistPage();
        break;
      case 3:
        page = CartPage();
        break;
      case 4:
        page = OrdersPage();
        break;
      case 5:
        page = ProfilePage();
        break;
      default:
        return;
    }

    // Gunakan pushReplacement agar tidak menumpuk stack
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context);
    final bottomPadding = mediaQuery.padding.bottom;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(
        left: 8,
        right: 8,
        top: 8,
        bottom: 8 + bottomPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Home
          _buildNavItem(
            context: context,
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
            label: 'Home',
            index: 0,
          ),

          // Category
          _buildNavItem(
            context: context,
            icon: Icons.category_outlined,
            activeIcon: Icons.category,
            label: 'Category',
            index: 1,
          ),

          // Wishlist
          _buildNavItem(
            context: context,
            icon: Icons.favorite_border,
            activeIcon: Icons.favorite,
            label: 'Wishlist',
            index: 2,
          ),

          // Cart with Badge
          _buildCartItem(context: context, index: 3),

          // Orders
          _buildNavItem(
            context: context,
            icon: Icons.receipt_outlined,
            activeIcon: Icons.receipt,
            label: 'Orders',
            index: 4,
          ),

          // Profile
          _buildNavItem(
            context: context,
            icon: Icons.person_outline,
            activeIcon: Icons.person,
            label: 'Profile',
            index: 5,
          ),
        ],
      ),
    );
  }

  // Widget untuk item navigasi biasa
  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    final isActive = currentIndex == index;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Expanded(
      child: InkWell(
        onTap: () {
          // Panggil onTap callback jika ada
          if (onTap != null) {
            onTap!(index);
          } else {
            // Kalau tidak ada callback, navigasi langsung
            _navigateToPage(context, index);
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isActive ? activeIcon : icon,
                size: 24,
                color: isActive
                    ? const Color(0xFFFFA726)
                    : (isDark ? Colors.grey[400] : Colors.grey),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'TomatoGrotesk',
                  fontSize: 10,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  color: isActive
                      ? const Color(0xFFFFA726)
                      : (isDark ? Colors.grey[400] : Colors.grey),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget khusus untuk cart dengan badge
  Widget _buildCartItem({
    required BuildContext context,
    required int index,
  }) {
    final isActive = currentIndex == index;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Expanded(
      child: InkWell(
        onTap: () {
          // Panggil onTap callback jika ada
          if (onTap != null) {
            onTap!(index);
          } else {
            // Kalau tidak ada callback, navigasi langsung
            _navigateToPage(context, index);
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    isActive ? Icons.shopping_cart : Icons.shopping_cart_outlined,
                    size: 24,
                    color: isActive
                        ? const Color(0xFFFFA726)
                        : (isDark ? Colors.grey[400] : Colors.grey),
                  ),
                  Positioned(
                    right: -6,
                    top: -4,
                    child: Container(
                      padding: const EdgeInsets.all(3),
=======
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10)],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            onTap(index); // tetap jalankan callback lama

            // 🔹 Navigasi antar halaman
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const WishlistPage()),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartPage()),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OrdersPage()),
                );
                break;
              case 4:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfilePage()),
                );
                break;
              default:
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Menu index $index belum diimplementasikan')),
                );
            }
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFFFFA726),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  const Icon(Icons.shopping_cart_outlined),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
<<<<<<< HEAD
                      constraints: const BoxConstraints(
                        minWidth: 14,
                        minHeight: 14,
                      ),
=======
                      constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                      child: const Text(
                        '14',
                        style: TextStyle(
                          color: Colors.white,
<<<<<<< HEAD
                          fontSize: 8,
=======
                          fontSize: 10,
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
<<<<<<< HEAD
              const SizedBox(height: 2),
              Text(
                'Cart',
                style: TextStyle(
                  fontFamily: 'TomatoGrotesk',
                  fontSize: 10,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  color: isActive
                      ? const Color(0xFFFFA726)
                      : (isDark ? Colors.grey[400] : Colors.grey),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
=======
              label: 'Cart',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.receipt_outlined),
              label: 'Orders',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
