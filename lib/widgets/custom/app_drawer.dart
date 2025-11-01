// lib/widgets/custom/app_drawer.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Drawer(
      child: Column(
        children: [
          // HEADER — WARNA OTOMATIS
          UserAccountsDrawerHeader(
            accountName: Text(
              'Roopa',
              style: TextStyle(
                fontFamily: 'TomatoGrotesk',
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            accountEmail: Text(
              'example@gmail.com',
              style: TextStyle(
                fontFamily: 'TomatoGrotesk',
                color: isDark ? Colors.white70 : Colors.black54,
              ),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/banner.png'),
            ),
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[850] : Colors.white,
            ),
            margin: EdgeInsets.zero,
          ),

          // MENU ITEMS
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero, // FIXED: HAPUS "EdgeColor:"
              children: [
                _buildMenuItem(context, Icons.home_outlined, 'Home', () {}),
                _buildMenuItem(context, Icons.category_outlined, 'Products', () {}),
                _buildMenuItem(context, Icons.widgets_outlined, 'Components', () {}),
                _buildMenuItem(context, Icons.diamond_outlined, 'Pages', () {}),
                _buildMenuItem(context, Icons.star_outline, 'Featured', () {}),
                _buildMenuItem(context, Icons.favorite_border, 'Wishlist', () {}),
                _buildMenuItem(context, Icons.receipt_long_outlined, 'Orders', () {}),
                _buildMenuItem(context, Icons.shopping_cart_outlined, 'My Cart', () {}),
                _buildMenuItem(context, Icons.person_outline, 'Profile', () {}),
                _buildMenuItem(context, Icons.chat_bubble_outline, 'Chat List', () {}),
                _buildMenuItem(context, Icons.logout, 'Logout', () {}),
              ],
            ),
          ),

          // THEME SWITCH
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Theme Option',
                  style: TextStyle(
                    fontFamily: 'TomatoGrotesk',
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                ),
                Switch(
                  value: isDark,
                  activeColor: const Color(0xFFFFA726),
                  onChanged: (value) {
                    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                  },
                ),
              ],
            ),
          ),

          // FOOTER — WARNA OTOMATIS
          Container(
            padding: const EdgeInsets.all(16),
            color: isDark ? Colors.grey[800] : Colors.grey[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'LensMart Glasses Store',
                  style: TextStyle(
                    fontFamily: 'TomatoGrotesk',
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFA726),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'App Version 1.0',
                  style: TextStyle(
                    fontFamily: 'TomatoGrotesk',
                    color: isDark ? Colors.white60 : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ListTile(
      leading: Icon(icon, color: const Color(0xFFFFA726)),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'TomatoGrotesk',
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }
}