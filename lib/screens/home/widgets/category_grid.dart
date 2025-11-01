import 'package:flutter/material.dart';

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({super.key});

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  final List<String> categories = ['All', 'Child', 'Men', 'Women', 'Dress'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.asMap().entries.map((entry) {
          int idx = entry.key;
          String name = entry.value;
          bool isSelected = idx == selectedIndex;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(
                name,
                style: TextStyle(
                  fontFamily: 'TomatoGrotesk',
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.orange[800] : Colors.black87,
                ),
              ),
              selected: isSelected,
              onSelected: (_) => setState(() => selectedIndex = idx),
              selectedColor: Colors.orange[50],
              backgroundColor: Colors.grey[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: isSelected ? Colors.orange : Colors.transparent),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}