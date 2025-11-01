// lib/screens/profile/profile_page.dart
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  // Navigasi placeholder (nanti diganti ke halaman asli)
  void _navigateTo(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Menuju ke: $feature")),
    );
    // TODO: Ganti dengan Navigator.push ke halaman masing-masing
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const SizedBox(),
        title: const Text(
          'LensMart',
          style: TextStyle(
            fontFamily: 'TomatoGrotesk',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_outlined), onPressed: () {}),
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === HEADER: Hello, Roopa ===
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundImage: const AssetImage('assets/images/verify.png'),
                    onBackgroundImageError: (_, __) => const Icon(Icons.person, size: 32),
                  ),
                  const SizedBox(width: 12),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 22),
                      children: [
                        const TextSpan(text: 'Hello, ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
                        TextSpan(text: 'Roopa', style: TextStyle(color: Color(0xFFFFA726), fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // === SHORTCUT BUTTONS ===
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildShortcut(context, 'Your Order', Icons.receipt_long_outlined),
                      _buildShortcut(context, 'Wishlist', Icons.favorite_border),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildShortcut(context, 'Coupons', Icons.local_offer_outlined),
                      _buildShortcut(context, 'Track Order', Icons.local_shipping_outlined),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // === ACCOUNT SETTINGS ===
            _buildSectionHeader('Account Settings'),
            _buildSettingsTile(context, Icons.person_outline, 'Edit Profile'),
            _buildSettingsTile(context, Icons.credit_card, 'Saved Cards & Wallet'),
            _buildSettingsTile(context, Icons.location_on_outlined, 'Saved Addresses'),
            _buildSettingsTile(context, Icons.language, 'Select Language'),
            _buildSettingsTile(context, Icons.notifications_outlined, 'Notifications Settings'),

            const SizedBox(height: 20),

            // === MY ACTIVITY ===
            _buildSectionHeader('My Activity'),
            _buildSettingsTile(context, Icons.star_border, 'Reviews'),
            _buildSettingsTile(context, Icons.question_answer_outlined, 'Questions & Answers'),
          ],
        ),
      ),
    );
  }

  // === WIDGET BUILDERS ===

  Widget _buildShortcut(BuildContext context, String label, IconData icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _navigateTo(context, label),
        child: Container(
          height: 56,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 8, spreadRadius: 1),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.orange, size: 20),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'TomatoGrotesk',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'TomatoGrotesk',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildSettingsTile(BuildContext context, IconData icon, String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.orange.shade50,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.orange, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'TomatoGrotesk',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () => _navigateTo(context, title),
    );
  }
}