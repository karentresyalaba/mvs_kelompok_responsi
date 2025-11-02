import 'package:flutter/material.dart';

class SavedAddressesPage extends StatelessWidget {
  const SavedAddressesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Addresses'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.home_outlined, color: Colors.orange),
              title: const Text('Home'),
              subtitle: const Text('Jl. Merdeka No. 10, Yogyakarta'),
              trailing: IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            icon: const Icon(Icons.add_location_alt_outlined),
            label: const Text('Add New Address'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
