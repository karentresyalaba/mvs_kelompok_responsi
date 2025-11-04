import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Provider
import 'providers/keranjang_provider.dart';
import 'providers/theme_provider.dart';


import 'screens/wishlist/wishlist_page.dart';
import 'screens/cart/cart_page.dart';

<<<<<<< HEAD
=======


>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
// Screens
import 'screens/category/category_screen.dart';
import 'screens/load/load_screen.dart';
import 'screens/home/home_page.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/auth/forgot_password_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/wishlist/wishlist_page.dart';
import 'screens/cart/cart_page.dart';import 'screens/wishlist/wishlist_page.dart';
import 'screens/cart/cart_page.dart';import 'screens/wishlist/wishlist_page.dart';
import 'screens/cart/cart_page.dart';import 'screens/wishlist/wishlist_page.dart';
import 'screens/cart/cart_page.dart';import 'screens/wishlist/wishlist_page.dart';
import 'screens/cart/cart_page.dart';import 'screens/wishlist/wishlist_page.dart';
import 'screens/cart/cart_page.dart';import 'screens/wishlist/wishlist_page.dart';
import 'screens/cart/cart_page.dart';import 'screens/wishlist/wishlist_page.dart';
import 'screens/cart/cart_page.dart';import 'screens/wishlist/wishlist_page.dart';
import 'screens/cart/cart_page.dart';import 'screens/wishlist/wishlist_page.dart';
import 'screens/cart/cart_page.dart';
<<<<<<< HEAD
=======
import 'screens/orders/orders_page.dart';
import 'screens/profile/profile_page.dart';

>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => KeranjangProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LensMart',
      theme: ThemeProvider.lightTheme,
      darkTheme: ThemeProvider.darkTheme,
      themeMode: themeProvider.themeMode,
      // halaman awal aplikasi
      home: const LoadScreen(),
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot': (context) => const ForgotPasswordScreen(),
        '/home': (context) => const HomePage(),
        '/category': (context) => const CategoryScreen(),
        // Tambahin di bagian routes di main.dart kelompok
        '/wishlist': (context) => const WishlistPage(),
        '/cart': (context) => const CartPage(),
<<<<<<< HEAD
=======
        '/orders': (context) => const OrdersPage(),
        '/profile': (context) => const ProfilePage(),





>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
      },
    );
  }
}
<<<<<<< HEAD
=======


>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
