// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/theme_provider.dart';
import 'providers/auth_provider.dart';

import 'screens/splash/splash_screen.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/home/home_page.dart';           // PAKAI home_page.dart
import 'screens/auth/forgot_password_screen.dart';
import 'screens/auth/register_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'LensMart',
          theme: themeProvider.currentTheme,
          initialRoute: '/splash',
          routes: {
            '/splash': (_) => const SplashScreen(),
            '/onboarding': (_) => const OnboardingScreen(),
            '/login': (_) => const LoginScreen(),
            '/home': (_) => const HomePage(),           // FIXED: HomePage, bukan HomeScreen
            '/forgot': (_) => const ForgotPasswordScreen(),
            '/register': (_) => const RegisterScreen(),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}