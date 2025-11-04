<<<<<<< HEAD
// lib/screens/orders/orders_page.dart
import 'package:flutter/material.dart';
import '../../widgets/custom/custom_bottom_nav.dart';
import '../../widgets/custom/app_drawer.dart';
=======
import 'package:flutter/material.dart';
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
<<<<<<< HEAD
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
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'My Order',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
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
                color: isDark ? Colors.grey[800] : Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.shopping_bag_outlined,
                color: isDark ? Colors.white : Colors.black,
                size: 20,
              ),
            ),
=======
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  bool isOngoingSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Order',
          style: TextStyle(
            fontFamily: 'TomatoGrotesk',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.home_outlined, color: Colors.black),
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
            onPressed: () {},
          ),
        ],
      ),
<<<<<<< HEAD
      drawer: const AppDrawer(),
      body: Column(
        children: [
          // Tab Selector
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[850] : Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
=======
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
<<<<<<< HEAD
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
                              : (isDark ? Colors.grey[400] : Colors.grey[600]),
                          fontFamily: 'TomatoGrotesk',
=======
                        isOngoingSelected = true;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      decoration: BoxDecoration(
                        color: isOngoingSelected ? const Color(0xFFFFA500) : Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Ongoing',
                        style: TextStyle(
                          fontFamily: 'TomatoGrotesk',
                          color: isOngoingSelected ? Colors.black : Colors.grey,
                          fontWeight: FontWeight.bold,
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                        ),
                      ),
                    ),
                  ),
                ),
<<<<<<< HEAD
=======
                const SizedBox(width: 8.0),
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
<<<<<<< HEAD
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
                              : (isDark ? Colors.grey[400] : Colors.grey[600]),
                          fontFamily: 'TomatoGrotesk',
=======
                        isOngoingSelected = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      decoration: BoxDecoration(
                        color: !isOngoingSelected ? const Color(0xFFFFA500) : Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Completed',
                        style: TextStyle(
                          fontFamily: 'TomatoGrotesk',
                          color: !isOngoingSelected ? Colors.black : Colors.grey,
                          fontWeight: FontWeight.bold,
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
<<<<<<< HEAD

          // Orders List
          Expanded(
            child: filteredOrders.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.receipt_long_outlined,
                          size: 80,
                          color: isDark ? Colors.grey[600] : Colors.grey[300],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No ${selectedTab == 'ongoing' ? 'ongoing' : 'completed'} orders',
                          style: TextStyle(
                            fontSize: 18,
                            color: isDark ? Colors.grey[400] : Colors.grey[600],
                            fontFamily: 'TomatoGrotesk',
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredOrders.length,
                    itemBuilder: (context, index) {
                      final order = filteredOrders[index];
                      return _buildOrderCard(order, isDark);
                    },
                  ),
          ),
        ],
      ),
      // Tambahkan CustomBottomNav
      bottomNavigationBar: const CustomBottomNav(
        currentIndex: 4, // Index 4: Orders
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order, bool isDark) {
    final isOngoing = order['status'] == 'ongoing';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.2 : 0.05),
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
                  color: isDark ? Colors.grey[800] : Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  order['image'],
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.image_not_supported,
                      color: Colors.grey[400],
                      size: 40,
                    );
                  },
                ),
              ),
              Positioned(
                top: 4,
                left: 4,
                child: GestureDetector(
                  onTap: () {
                    // Toggle wishlist
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Added to wishlist'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.grey[800] : Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      size: 18,
                      color: isDark ? Colors.white : Colors.grey,
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
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : Colors.black,
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Track Order'),
                              backgroundColor: Color(0xFFFFA726),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        } else {
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
                          color: isDark ? Colors.grey[800] : Colors.grey[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          isOngoing ? 'Track Order' : 'Write Review',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: isDark ? Colors.white : Colors.black,
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
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: isDark ? Colors.white : Colors.black,
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
=======
          Expanded(
            child: isOngoingSelected
                ? ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(
                                  'assets/images/product1.png', // Assuming this is the glasses image; replace with appropriate asset if needed
                                  width: 80.0,
                                  height: 80.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Silver Purple Full Rim',
                                      style: TextStyle(
                                        fontFamily: 'TomatoGrotesk',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const Text(
                                      'Cat Eye',
                                      style: TextStyle(
                                        fontFamily: 'TomatoGrotesk',
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      child: const Text(
                                        'Track Order',
                                        style: TextStyle(
                                          fontFamily: 'TomatoGrotesk',
                                          color: Colors.black,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4.0),
                                    const Text(
                                      'FREE Delivery',
                                      style: TextStyle(
                                        fontFamily: 'TomatoGrotesk',
                                        color: Colors.green,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text(
                                      '\$100',
                                      style: TextStyle(
                                        fontFamily: 'TomatoGrotesk',
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.star,
                                          color: Color(0xFFFFA500),
                                          size: 16.0,
                                        ),
                                        Text(
                                          '4.8',
                                          style: TextStyle(
                                            fontFamily: 'TomatoGrotesk',
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'No completed orders',
                      style: TextStyle(
                        fontFamily: 'TomatoGrotesk',
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
          ),
        ],
      ),
    );
  }
}