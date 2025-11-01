// lib/screens/onboarding/onboarding_screen.dart
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/images/onboarding.png',
      'title_main': 'Glass',
      'title_sub': 'for eye',
      'subtitle': 'You\'re at the right place!',
    },
    {
      'image': 'assets/images/onboarding.png',
      'title_main': 'Glass',
      'title_sub': 'for eye',
      'subtitle': 'You\'re at the right place!',
    },
    {
      'image': 'assets/images/onboarding.png',
      'title_main': 'Glass',
      'title_sub': 'for eye',
      'subtitle': 'You\'re at the right place!',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // PageView: Gambar Full Layar
          PageView.builder(
            controller: _pageController,
            onPageChanged: (value) => setState(() => _currentPage = value),
            itemCount: _pages.length,
            itemBuilder: (context, index) => _buildPage(_pages[index]),
          ),

          // Overlay: Teks + Tombol + Dots (di bawah gambar, tanpa vignette gradient)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(40, 160, 40, 40), // Sesuaikan padding top untuk posisi lebih bawah
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Main (besar)
                  Text(
                    _pages[_currentPage]['title_main'] ?? 'Glass', // Use ?? to avoid null check error if key missing
                    style: const TextStyle(
                      fontFamily: 'TomatoGrotesk',
                      fontSize: 80, // Ukuran lebih besar untuk "Glass" sesuai desain
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.0,
                    ),
                  ),
                  // Title Sub (kecil di bawah)
                  Text(
                    _pages[_currentPage]['title_sub'] ?? 'for eye', // Use ?? to avoid null check error if key missing
                    style: const TextStyle(
                      fontFamily: 'TomatoGrotesk',
                      fontSize: 50, // Ukuran lebih kecil untuk "for eye" sesuai desain
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.0,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Subtitle
                  Text(
                    _pages[_currentPage]['subtitle'] ?? 'You\'re at the right place!', // Use ?? to avoid null check error if key missing
                    style: const TextStyle(
                      fontFamily: 'TomatoGrotesk',
                      fontSize: 20, // Ukuran disesuaikan lebih kecil sesuai desain
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Divider + Dots (garis slide di tengah, seperti dashes)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                      (i) => Container(
                        margin: const EdgeInsets.only(right: 12),
                        width: i == _currentPage ? 30 : 10,
                        height: 2,
                        decoration: BoxDecoration(
                          color: i == _currentPage ? Colors.black : Colors.black38,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Tombol Get Started + Panah di LUAR
                  Row(
                    children: [
                      // Tombol Get Started
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 10,
                            shadowColor: Colors.black45,
                          ),
                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                              fontFamily: 'TomatoGrotesk',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Panah di LUAR Tombol (bulatan orange pudar / cream disesuaikan lebih akurat)
                      GestureDetector(
                        onTap: () {
                          if (_currentPage < _pages.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          } else {
                            Navigator.pushReplacementNamed(context, '/login');
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Color(0xFFFDD096), // Warna cream/orange pudar lebih sesuai desain
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.arrow_forward, size: 24, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(Map<String, String> data) {
    return Image.asset(
      data['image'] ?? 'assets/images/onboarding.png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => Container(color: Colors.grey.shade900),
    );
  }
}