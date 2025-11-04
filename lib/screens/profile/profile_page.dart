<<<<<<< HEAD
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
=======
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
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
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
<<<<<<< HEAD
      case 'Select Language':
        page = const SelectLanguagePage();
        break;
      case 'Notifications Settings':
        page = const NotificationsSettingsPage();
=======
      case 'Notifications Settings':
        page = const NotificationsPage();
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
        break;
      case 'Reviews':
        page = const ReviewsPage();
        break;
      case 'Questions & Answers':
<<<<<<< HEAD
        page = const QuestionsAnswersPage();
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Fitur $feature belum tersedia")),
        );
        return;
=======
        page = const QuestionsPage();
        break;
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
    }

    if (page != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page!),
      );
<<<<<<< HEAD
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
=======
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
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
          'LensMart',
          style: TextStyle(
            fontFamily: 'TomatoGrotesk',
            fontSize: 22,
            fontWeight: FontWeight.bold,
<<<<<<< HEAD
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
=======
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_outlined), onPressed: () {}),
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
<<<<<<< HEAD
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === HEADER: Hello, Roopa ===
=======
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === HEADER ===
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Row(
                children: [
<<<<<<< HEAD
                  GestureDetector(
                    onTap: () => _navigateTo(context, 'Edit Profile'),
                    child: CircleAvatar(
                      radius: 26,
                      backgroundImage: const AssetImage('assets/images/verify.png'),
                      backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
                      onBackgroundImageError: (_, __) {},
                      child: const Icon(Icons.person, size: 32),
                    ),
=======
                  CircleAvatar(
                    radius: 26,
                    backgroundImage: const AssetImage('assets/images/verify.png'),
                    onBackgroundImageError: (_, __) => const Icon(Icons.person, size: 32),
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                  ),
                  const SizedBox(width: 12),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 22),
                      children: [
<<<<<<< HEAD
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
=======
                        const TextSpan(text: 'Hello, ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
                        TextSpan(text: 'Roopa', style: TextStyle(color: Color(0xFFFFA726), fontWeight: FontWeight.w600)),
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                      ],
                    ),
                  ),
                ],
              ),
            ),

<<<<<<< HEAD
            const SizedBox(height: 8),

=======
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
            // === SHORTCUT BUTTONS ===
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
<<<<<<< HEAD
                      _buildShortcut(context, 'Your Order', Icons.receipt_long_outlined, isDark),
                      _buildShortcut(context, 'Wishlist', Icons.favorite_border, isDark),
=======
                      _buildShortcut(context, 'Your Order', Icons.receipt_long_outlined),
                      _buildShortcut(context, 'Wishlist', Icons.favorite_border),
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
<<<<<<< HEAD
                      _buildShortcut(context, 'Coupons', Icons.local_offer_outlined, isDark),
                      _buildShortcut(context, 'Track Order', Icons.local_shipping_outlined, isDark),
=======
                      _buildShortcut(context, 'Coupons', Icons.local_offer_outlined),
                      _buildShortcut(context, 'Track Order', Icons.local_shipping_outlined),
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // === ACCOUNT SETTINGS ===
<<<<<<< HEAD
            _buildSectionHeader('Account Settings', isDark),
            _buildSettingsTile(context, Icons.person_outline, 'Edit Profile', isDark),
            _buildSettingsTile(context, Icons.credit_card, 'Saved Cards & Wallet', isDark),
            _buildSettingsTile(context, Icons.location_on_outlined, 'Saved Addresses', isDark),
            _buildSettingsTile(context, Icons.language, 'Select Language', isDark),
            _buildSettingsTile(context, Icons.notifications_outlined, 'Notifications Settings', isDark),
=======
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
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336

            const SizedBox(height: 20),

            // === MY ACTIVITY ===
<<<<<<< HEAD
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
=======
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
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
    return Expanded(
      child: GestureDetector(
        onTap: () => _navigateTo(context, label),
        child: Container(
          height: 56,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
<<<<<<< HEAD
            color: isDark ? Colors.grey[850] : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isDark ? 0.3 : 0.1),
                blurRadius: 8,
                spreadRadius: 1,
              ),
=======
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 8, spreadRadius: 1),
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
<<<<<<< HEAD
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
=======
              Icon(icon, color: Colors.orange, size: 20),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'TomatoGrotesk',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

<<<<<<< HEAD
  Widget _buildSectionHeader(String title, bool isDark) {
=======
  Widget _buildSectionHeader(String title) {
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
<<<<<<< HEAD
        style: TextStyle(
          fontFamily: 'TomatoGrotesk',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : Colors.black87,
=======
        style: const TextStyle(
          fontFamily: 'TomatoGrotesk',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
        ),
      ),
    );
  }

<<<<<<< HEAD
  Widget _buildSettingsTile(BuildContext context, IconData icon, String title, bool isDark) {
=======
  Widget _buildSettingsTile(BuildContext context, IconData icon, String title) {
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
<<<<<<< HEAD
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
=======
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
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
      onTap: () => _navigateTo(context, title),
    );
  }
}
<<<<<<< HEAD

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
=======
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
