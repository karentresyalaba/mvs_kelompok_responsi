import 'package:flutter/material.dart';

class CouponsPage extends StatelessWidget {
  const CouponsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coupons'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: const Center(
        child: Text('You have no coupons available 🎟️'),
      ),
    );
  }
}
