// lib/screens/splash/splash_screen.dart
import 'package:flutter/material.dart';
import 'dart:async';
import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // === LOGO ANIMATION ===
  late final AnimationController _logoCtrl;
  late final Animation<double> _logoScale;
  late final Animation<double> _logoFade;

  // === LETTER ANIMATION ===
  final String _text = 'LensMart';
  final List<bool> _letterVisible = List.filled(8, false); // 8 huruf
  Timer? _letterTimer;

  @override
  void initState() {
    super.initState();

    // ==== LOGO ====
    _logoCtrl = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _logoScale = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _logoCtrl, curve: Curves.easeOutBack),
    );

    _logoFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoCtrl, curve: const Interval(0.0, 0.6)),
    );

    // Mulai animasi logo setelah 600ms
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        _logoCtrl.forward().then((_) {
          // Setelah logo selesai → mulai muncul huruf satu per satu
          _startLetterAnimation();
        });
      }
    });

    // Pindah ke Onboarding setelah 3 detik
    Timer(const Duration(milliseconds: 3000), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const OnboardingScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
            transitionDuration: const Duration(milliseconds: 600),
          ),
        );
      }
    });
  }

  void _startLetterAnimation() {
    int index = 0;
    _letterTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (index < _text.length) {
        setState(() {
          _letterVisible[index] = true;
        });
        index++;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _logoCtrl.dispose();
    _letterTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // === BACKGROUND IMAGE ===
          Image.asset(
            'assets/images/bg1.png',
            fit: BoxFit.cover,
          ),

          // === LOGO + LETTER BY LETTER FROM BOTTOM ===
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // LOGO: zoom-in + fade
                FadeTransition(
                  opacity: _logoFade,
                  child: ScaleTransition(
                    scale: _logoScale,
                    child: Image.asset(
                      'assets/images/logo-dark.png',
                      height: 110,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.visibility,
                        size: 90,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // TEKS: muncul satu per satu dari bawah
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildLetters(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildLetters() {
    List<Widget> letters = [];
    for (int i = 0; i < _text.length; i++) {
      final char = _text[i];
      final isBold = i < 4; // Lens = bold, Mart = normal

      letters.add(
        AnimatedSlide(
          offset: _letterVisible[i] ? Offset.zero : const Offset(0, 1.5),
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutBack,
          child: AnimatedOpacity(
            opacity: _letterVisible[i] ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Text(
              char,
              style: TextStyle(
                fontFamily: 'TomatoGrotesk',
                fontSize: 42,
                fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
                color: Colors.black,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
      );
    }
    return letters;
  }
}