// lib/widgets/custom/app_drawer.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';

// Screens
import '../../screens/splash/splash_screen.dart';
import '../../screens/home/home_page.dart';
import '../../screens/components/components_page.dart';
import '../../screens/pages/pages_page.dart';
import '../../screens/profile/profile_page.dart';
import '../../screens/chat/chat_list_page.dart';
import '../../screens/notifications/notifications_page.dart';
import '../../screens/orders/orders_page.dart';
import '../../screens/wishlist/wishlist_page.dart' as wishlist;
import '../../screens/cart/cart_page.dart' as cart;
import '../../screens/product/product_list_screen.dart';
import '../../screens/auth/login_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Drawer(
      backgroundColor: isDark ? Colors.grey[900] : Colors.white,
      child: Column(
        children: [
          // ============================================
          // HEADER - Simple Design
          // ============================================
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 20),
            color: isDark ? Colors.grey[900] : Colors.white,
            child: Row(
              children: [
                // Profile Picture
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/banner.png'),
                ),
                const SizedBox(width: 16),
                // Name and Email
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Roopa',
                        style: TextStyle(
                          fontFamily: 'TomatoGrotesk',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'example@gmail.com',
                        style: TextStyle(
                          fontFamily: 'TomatoGrotesk',
                          fontSize: 14,
                          color: isDark ? Colors.grey[400] : Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Divider after header
          Divider(
            height: 1,
            thickness: 1,
            color: isDark ? Colors.grey[800] : Colors.grey[200],
          ),

          // ============================================
          // MENU ITEMS
          // ============================================
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _buildMenuItem(
                  context,
                  Icons.home_outlined,
                  'Home',
                  () => _navigate(context, HomePage()),
                ),
                
                _buildMenuItem(
                  context,
                  Icons.shopping_bag_outlined,
                  'Products',
                  () => _navigate(context, ProductListScreen(title: 'Products')),
                ),
                
                _buildMenuItem(
                  context,
                  Icons.apps_outlined,
                  'Components',
                  () => _navigate(context, ComponentsPage()),
                ),
                
                _buildMenuItem(
                  context,
                  Icons.diamond_outlined,
                  'Pages',
                  () => _navigate(context, PagesPage()),
                ),

                _buildMenuItem(
                  context,
                  Icons.star_outline,
                  'Featured',
                  () {
                    Navigator.pop(context);
                  },
                ),
                
                _buildMenuItem(
                  context,
                  Icons.favorite_border,
                  'Wishlist',
                  () => _navigate(context, wishlist.WishlistPage()),
                ),
                
                _buildMenuItem(
                  context,
                  Icons.receipt_long_outlined,
                  'Orders',
                  () => _navigate(context, OrdersPage()),
                ),
                
                _buildMenuItem(
                  context,
                  Icons.shopping_cart_outlined,
                  'My Cart',
                  () => _navigate(context, cart.CartPage()),
                ),

                _buildMenuItem(
                  context,
                  Icons.person_outline,
                  'Profile',
                  () => _navigate(context, ProfilePage()),
                ),
                
                _buildMenuItem(
                  context,
                  Icons.chat_bubble_outline,
                  'Chat List',
                  () => _navigate(context, ChatListPage()),
                ),

                // Divider
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: isDark ? Colors.grey[800] : Colors.grey[200],
                  ),
                ),

                // 🔥 LOGOUT
                ListTile(
                  leading: const Icon(Icons.logout, color: Color(0xFFFFA726)),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      fontFamily: 'TomatoGrotesk',
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    Navigator.of(context).pop();
                    await Future.delayed(const Duration(milliseconds: 250));
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SplashScreen(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),

          // THEME OPTION
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[900] : Colors.white,
              border: Border(
                top: BorderSide(
                  color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Theme Option',
                  style: TextStyle(
                    fontFamily: 'TomatoGrotesk',
                    color: isDark ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.grey[800] : Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      isDark ? Icons.dark_mode : Icons.dark_mode_outlined,
                      color: isDark ? Colors.white : Colors.black,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================
  // HELPER METHODS
  // ============================================

  /// Helper untuk navigasi tanpa async warning
  void _navigate(BuildContext context, Widget page) {
    Navigator.pop(context);
    Future.microtask(() {
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    });
  }

  /// Widget untuk item menu
  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      minVerticalPadding: 12,
      leading: Icon(
        icon,
        color: const Color(0xFFFFA726),
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'TomatoGrotesk',
          color: isDark ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: isDark ? Colors.white54 : Colors.black54,
        size: 24,
      ),
      onTap: () async {
        Navigator.pop(context);
        await Future.delayed(const Duration(milliseconds: 150));
        onTap();
      },
    );
  }
}