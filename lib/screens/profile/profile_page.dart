import 'package:flutter/material.dart';
import '../orders/orders_page.dart';
import '../wishlist/wishlist_page.dart';
import '../profile/edit_profile_page.dart';
import '../profile/saved_cards_page.dart';
import '../profile/saved_addresses_page.dart';
import '../notifications/notifications_page.dart';
import '../profile/reviews_page.dart';
import '../profile/questions_page.dart';
import '../profile/coupons_page.dart';
import '../profile/track_order_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String selectedLang = 'English';
  String selectedFlag = 'assets/images/flag/united_states.png';

  // Fungsi navigasi ke setiap halaman (selain Select Language)
  void _navigateTo(BuildContext context, String feature) {
    Widget? page;

    switch (feature) {
      case 'Your Order':
        page = const OrdersPage();
        break;
      case 'Wishlist':
        page = const WishlistPage();
        break;
      case 'Coupons':
        page = const CouponsPage();
        break;
      case 'Track Order':
        page = const TrackOrderPage();
        break;
      case 'Edit Profile':
        page = const EditProfilePage();
        break;
      case 'Saved Cards & Wallet':
        page = const SavedCardsPage();
        break;
      case 'Saved Addresses':
        page = const SavedAddressesPage();
        break;
      case 'Notifications Settings':
        page = const NotificationsPage();
        break;
      case 'Reviews':
        page = const ReviewsPage();
        break;
      case 'Questions & Answers':
        page = const QuestionsPage();
        break;
    }

    if (page != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page!),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Menu belum tersedia: $feature")),
      );
    }
  }

  // === Bottom Sheet untuk pilih bahasa ===
  void _showLanguageSelector(BuildContext context) {
    final languages = [
      {'name': 'Hindi', 'flag': 'assets/images/flag/india.png'},
      {'name': 'English', 'flag': 'assets/images/flag/united_states.png'},
      {'name': 'German', 'flag': 'assets/images/flag/germany.png'},
      {'name': 'Italian', 'flag': 'assets/images/flag/italy.png'},
      {'name': 'Spanish', 'flag': 'assets/images/flag/spain.png'},
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'Language',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(height: 1),
              ...languages.map((lang) {
                return ListTile(
                  leading: Image.asset(lang['flag']!, width: 32, height: 32),
                  title: Text(
                    lang['name']!,
                    style: const TextStyle(fontSize: 16),
                  ),
                  onTap: () {
                    setState(() {
                      selectedLang = lang['name']!;
                      selectedFlag = lang['flag']!;
                    });
                    Navigator.pop(context);
                  },
                );
              }),
            ],
          ),
        );
      },
    );
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
            // === HEADER ===
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

            // --- SELECT LANGUAGE CUSTOM TILE ---
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.language, color: Colors.orange, size: 20),
              ),
              title: Row(
                children: [
                  Image.asset(selectedFlag, width: 28, height: 28),
                  const SizedBox(width: 10),
                  Text(
                    selectedLang,
                    style: const TextStyle(
                      fontFamily: 'TomatoGrotesk',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () => _showLanguageSelector(context),
            ),

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

  // === Helper Widgets ===

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
