// lib/screens/orders/orders_page.dart
import 'package:flutter/material.dart';
import '../../widgets/custom/app_drawer.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  String selectedTab = 'ongoing'; // 'ongoing' or 'completed'

  // Sample order data
  final List<Map<String, dynamic>> orders = [
    {
      'id': '1',
      'name': 'Silver Purple Full Rim Cat Eye',
      'price': '\$1100',
      'rating': 4.8,
      'image': 'assets/images/product1.png',
      'status': 'ongoing',
    },
    {
      'id': '2',
      'name': 'Silver Purple Full Rim Cat Eye',
      'price': '\$1100',
      'rating': 4.8,
      'image': 'assets/images/product2.png',
      'status': 'ongoing',
    },
    {
      'id': '3',
      'name': 'Silver Purple Full Rim Cat Eye',
      'price': '\$1100',
      'rating': 4.8,
      'image': 'assets/images/product3.png',
      'status': 'ongoing',
    },
    {
      'id': '4',
      'name': 'Silver Purple Full Rim Cat Eye',
      'price': '\$1100',
      'rating': 4.8,
      'image': 'assets/images/product4.png',
      'status': 'completed',
    },
    {
      'id': '5',
      'name': 'Silver Purple Full Rim Cat Eye',
      'price': '\$1100',
      'rating': 4.8,
      'image': 'assets/images/product5.png',
      'status': 'completed',
    },
    {
      'id': '6',
      'name': 'Silver Purple Full Rim Cat Eye',
      'price': '\$1100',
      'rating': 4.8,
      'image': 'assets/images/product6.png',
      'status': 'completed',
    },
  ];

  List<Map<String, dynamic>> get filteredOrders {
    return orders.where((order) => order['status'] == selectedTab).toList();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.grey[900] : Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'My Order',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'TomatoGrotesk',
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
                size: 20,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          // Tab Selector
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = 'ongoing';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: selectedTab == 'ongoing'
                            ? const Color(0xFFFFA726)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Ongoing',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: selectedTab == 'ongoing'
                              ? Colors.black
                              : Colors.grey[600],
                          fontFamily: 'TomatoGrotesk',
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = 'completed';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: selectedTab == 'completed'
                            ? const Color(0xFFFFA726)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Completed',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: selectedTab == 'completed'
                              ? Colors.black
                              : Colors.grey[600],
                          fontFamily: 'TomatoGrotesk',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Orders List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredOrders.length,
              itemBuilder: (context, index) {
                final order = filteredOrders[index];
                return _buildOrderCard(order);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    final isOngoing = order['status'] == 'ongoing';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image with Wishlist
          Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  order['image'],
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: 4,
                left: 4,
                child: GestureDetector(
                  onTap: () {
                    // Toggle wishlist
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 16),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order['name'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: 'TomatoGrotesk',
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'FREE Delivery',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4CAF50),
                    fontFamily: 'TomatoGrotesk',
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Track Order / Write Review Button
                    GestureDetector(
                      onTap: () {
                        if (isOngoing) {
                          // Navigate to track order page
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Track Order'),
                              backgroundColor: Color(0xFFFFA726),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        } else {
                          // Navigate to write review page
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Write Review'),
                              backgroundColor: Color(0xFFFFA726),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          isOngoing ? 'Track Order' : 'Write Review',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontFamily: 'TomatoGrotesk',
                          ),
                        ),
                      ),
                    ),

                    // Price and Rating
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          order['price'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE91E63),
                            fontFamily: 'TomatoGrotesk',
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xFFFFA726),
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              order['rating'].toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontFamily: 'TomatoGrotesk',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}