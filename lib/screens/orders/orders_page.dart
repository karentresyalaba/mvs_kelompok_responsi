import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Orders',
          style: TextStyle(
            fontFamily: 'TomatoGrotesk',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: const Center(
        child: Text(
          'No orders yet 🛍️',
          style: TextStyle(
            fontFamily: 'TomatoGrotesk',
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
