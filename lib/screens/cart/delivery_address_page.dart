// lib/screens/cart/delivery_address_page.dart
import 'package:flutter/material.dart';
import '../../models/address.dart';
import 'checkout_page.dart';
import 'add_delivery_address_page.dart';

class DeliveryAddressPage extends StatefulWidget {
  const DeliveryAddressPage({Key? key}) : super(key: key);

  @override
  State<DeliveryAddressPage> createState() => _DeliveryAddressPageState();
}

class _DeliveryAddressPageState extends State<DeliveryAddressPage> {
  List<Address> addresses = [
    Address(
      id: '1',
      type: 'Home Address',
      address: '123 Main Street, Anytown, USA 12345',
      icon: Icons.home_outlined,
      isSelected: true,
    ),
    Address(
      id: '2',
      type: 'Office Address',
      address: '456 Elm Avenue, Smallville, CA 98765',
      icon: Icons.location_on_outlined,
    ),
    Address(
      id: '3',
      type: 'Home Address',
      address: '789 Maple Lane, Suburbia, NY 54321',
      icon: Icons.home_outlined,
    ),
    Address(
      id: '4',
      type: 'Shop Address',
      address: '654 Pine Road, Countryside, FL 34567',
      icon: Icons.store_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Delivery Address',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'TomatoGrotesk',
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: addresses.length + 1,
              itemBuilder: (context, index) {
                if (index == addresses.length) {
                  return Container(
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFA726).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.add, color: Color(0xFFFFA726)),
                      ),
                      title: const Text(
                        'Add Address',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'TomatoGrotesk',
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const AddDeliveryAddressPage(),
                          ),
                        );
                      },
                    ),
                  );
                }

                final address = addresses[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[200]!),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFA726).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(address.icon, color: const Color(0xFFFFA726)),
                    ),
                    title: Text(
                      address.type,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'TomatoGrotesk',
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        address.address,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          fontFamily: 'TomatoGrotesk',
                        ),
                      ),
                    ),
                    trailing: Radio<bool>(
                      value: true,
                      groupValue: address.isSelected,
                      activeColor: const Color(0xFFFFA726),
                      onChanged: (value) {
                        setState(() {
                          for (var addr in addresses) {
                            addr.isSelected = false;
                          }
                          address.isSelected = true;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckoutPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFA726),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Save Address',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: 'TomatoGrotesk',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}