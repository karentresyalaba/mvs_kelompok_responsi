import 'dart:async';

import 'package:flutter/material.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({Key? key}) : super(key: key);

  @override
  State<LoadScreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  void initState() {
    super.initState();
    // After a short delay, navigate to home (named route '/home').
    Timer(const Duration(milliseconds: 1800), () {
      if (mounted) Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
  final bgColor = const Color(0xFFF5CFA0); // warm pale peach background

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              // Try to navigate to '/home' if available; ignore errors if not wired yet.
              try {
                Navigator.of(context).pushReplacementNamed('/home');
              } catch (_) {
                // route not found or not wired — ignore to avoid crashing during development
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Rounded square image container with cream frame
                Container(
                  width: 280,
                  height: 280,
                  padding: const EdgeInsets.all(12), // cream frame thickness
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF6EA), // cream frame color
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 14,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/welcome.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.white,
                        child: const Center(
                          child: Icon(
                            Icons.remove_red_eye_outlined,
                            size: 80,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // Optional small hint
                Text(
                  'Tap to continue',
                  style: TextStyle(
                    color: Colors.brown.shade700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
