import 'package:flutter/material.dart';

class SavedCardsPage extends StatelessWidget {
  const SavedCardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Cards & Wallet'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.credit_card, color: Colors.orange),
              title: const Text('Visa •••• 1234'),
              subtitle: const Text('Expires 08/26'),
              trailing: TextButton(
                onPressed: () {},
                child: const Text('Remove', style: TextStyle(color: Colors.redAccent)),
              ),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            icon: const Icon(Icons.add_card_outlined),
            label: const Text('Add New Card'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Add card feature coming soon')),
              );
            },
          ),
        ],
      ),
    );
  }
}
