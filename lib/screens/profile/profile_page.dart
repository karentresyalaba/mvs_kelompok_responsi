// lib/screens/profile/profile_page.dart
import 'package:flutter/material.dart';
import '../../widgets/custom/custom_bottom_nav.dart';

// Import halaman yang sudah ada di tempat lain
import '../wishlist/wishlist_page.dart' as wishlist_screen;

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  void _navigateTo(BuildContext context, String feature) {
    Widget? page;
    
    switch (feature) {
      case 'Your Order':
        page = const YourOrderPage();
        break;
      case 'Wishlist':
        page = const wishlist_screen.WishlistPage();
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
      case 'Select Language':
        page = const SelectLanguagePage();
        break;
      case 'Notifications Settings':
        page = const NotificationsSettingsPage();
        break;
      case 'Reviews':
        page = const ReviewsPage();
        break;
      case 'Questions & Answers':
        page = const QuestionsAnswersPage();
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Fitur $feature belum tersedia")),
        );
        return;
    }

    if (page != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDark ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'LensMart',
          style: TextStyle(
            fontFamily: 'TomatoGrotesk',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: isDark ? Colors.white : Colors.black,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Notifications")),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: isDark ? Colors.white : Colors.black,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Search")),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === HEADER: Hello, Roopa ===
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => _navigateTo(context, 'Edit Profile'),
                    child: CircleAvatar(
                      radius: 26,
                      backgroundImage: const AssetImage('assets/images/verify.png'),
                      backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
                      onBackgroundImageError: (_, __) {},
                      child: const Icon(Icons.person, size: 32),
                    ),
                  ),
                  const SizedBox(width: 12),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 22),
                      children: [
                        TextSpan(
                          text: 'Hello, ',
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const TextSpan(
                          text: 'Roopa',
                          style: TextStyle(
                            color: Color(0xFFFFA726),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
                      _buildShortcut(context, 'Your Order', Icons.receipt_long_outlined, isDark),
                      _buildShortcut(context, 'Wishlist', Icons.favorite_border, isDark),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildShortcut(context, 'Coupons', Icons.local_offer_outlined, isDark),
                      _buildShortcut(context, 'Track Order', Icons.local_shipping_outlined, isDark),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // === ACCOUNT SETTINGS ===
            _buildSectionHeader('Account Settings', isDark),
            _buildSettingsTile(context, Icons.person_outline, 'Edit Profile', isDark),
            _buildSettingsTile(context, Icons.credit_card, 'Saved Cards & Wallet', isDark),
            _buildSettingsTile(context, Icons.location_on_outlined, 'Saved Addresses', isDark),
            _buildSettingsTile(context, Icons.language, 'Select Language', isDark),
            _buildSettingsTile(context, Icons.notifications_outlined, 'Notifications Settings', isDark),

            const SizedBox(height: 20),

            // === MY ACTIVITY ===
            _buildSectionHeader('My Activity', isDark),
            _buildSettingsTile(context, Icons.star_border, 'Reviews', isDark),
            _buildSettingsTile(context, Icons.question_answer_outlined, 'Questions & Answers', isDark),
          ],
        ),
      ),
      // Tambahkan CustomBottomNav
      bottomNavigationBar: const CustomBottomNav(
        currentIndex: 5, // Index 5: Profile
      ),
    );
  }

  Widget _buildShortcut(BuildContext context, String label, IconData icon, bool isDark) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _navigateTo(context, label),
        child: Container(
          height: 56,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[850] : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isDark ? 0.3 : 0.1),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: const Color(0xFFFFA726), size: 20),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'TomatoGrotesk',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'TomatoGrotesk',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : Colors.black87,
        ),
      ),
    );
  }

  Widget _buildSettingsTile(BuildContext context, IconData icon, String title, bool isDark) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFFFA726).withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: const Color(0xFFFFA726), size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'TomatoGrotesk',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: isDark ? Colors.grey[600] : Colors.grey,
      ),
      onTap: () => _navigateTo(context, title),
    );
  }
}

// ========================================
// PLACEHOLDER PAGES (Kecuali Wishlist)
// ========================================

// Base template untuk semua halaman
class _BasePage extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;

  const _BasePage({
    required this.title,
    required this.icon,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDark ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDark ? Colors.white : Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'TomatoGrotesk',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: const Color(0xFFFFA726)),
            const SizedBox(height: 24),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'TomatoGrotesk',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'TomatoGrotesk',
                  fontSize: 16,
                  color: isDark ? Colors.grey[400] : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 1. Your Order Page
class YourOrderPage extends StatelessWidget {
  const YourOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _BasePage(
      title: 'Your Order',
      icon: Icons.receipt_long_outlined,
      description: 'Halaman ini akan menampilkan semua pesanan Anda',
    );
  }
}

// 3. Coupons Page
class CouponsPage extends StatelessWidget {
  const CouponsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _BasePage(
      title: 'Coupons',
      icon: Icons.local_offer_outlined,
      description: 'Lihat semua kupon dan diskon yang tersedia',
    );
  }
}

// 4. Track Order Page
class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _BasePage(
      title: 'Track Order',
      icon: Icons.local_shipping_outlined,
      description: 'Lacak status pengiriman pesanan Anda',
    );
  }
}

// 5. Edit Profile Page
class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _BasePage(
      title: 'Edit Profile',
      icon: Icons.person_outline,
      description: 'Perbarui informasi profil Anda',
    );
  }
}

// 6. Saved Cards Page
class SavedCardsPage extends StatelessWidget {
  const SavedCardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _BasePage(
      title: 'Saved Cards & Wallet',
      icon: Icons.credit_card,
      description: 'Kelola kartu dan dompet digital Anda',
    );
  }
}

// 7. Saved Addresses Page
class SavedAddressesPage extends StatelessWidget {
  const SavedAddressesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _BasePage(
      title: 'Saved Addresses',
      icon: Icons.location_on_outlined,
      description: 'Kelola alamat pengiriman Anda',
    );
  }
}

// 8. Select Language Page
class SelectLanguagePage extends StatelessWidget {
  const SelectLanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _BasePage(
      title: 'Select Language',
      icon: Icons.language,
      description: 'Pilih bahasa yang Anda inginkan',
    );
  }
}

// 9. Notifications Settings Page
class NotificationsSettingsPage extends StatelessWidget {
  const NotificationsSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _BasePage(
      title: 'Notifications Settings',
      icon: Icons.notifications_outlined,
      description: 'Atur preferensi notifikasi Anda',
    );
  }
}

// 10. Reviews Page
class ReviewsPage extends StatelessWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _BasePage(
      title: 'Reviews',
      icon: Icons.star_border,
      description: 'Lihat dan tulis review produk',
    );
  }
}

// 11. Questions & Answers Page
class QuestionsAnswersPage extends StatelessWidget {
  const QuestionsAnswersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _BasePage(
      title: 'Questions & Answers',
      icon: Icons.question_answer_outlined,
      description: 'Tanyakan dan jawab pertanyaan seputar produk',
    );
  }
}