import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../../providers/keranjang_provider.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatefulWidget {
  final String title;
  const ProductListScreen({super.key, required this.title});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  int _selectedFilter = 0;
  final List<String> _filters = ['Crazy Deals', 'Budget Buys', 'Best Offer'];
  bool _isListView = false; // Toggle untuk grid/list view
  
  // State untuk modal
  String _selectedGender = 'Male';
  String _selectedSort = 'Necklace';
  List<String> _selectedBrands = <String>['Adidas'];
  List<String> _selectedCategories = <String>['All'];
  List<String> _selectedSizes = <String>['Small'];

  final List<Map<String, dynamic>> products = List.generate(20, (i) {
    final imageIndex = (i % 6) + 1;
    return {
      'image': 'assets/images/product$imageIndex.png',
      'name': 'Silver Purple Full Rim Cat Eye',
      'price': 1100,
      'rating': 4.8,
      'powered': [2, 3, 5, 7, 9, 11, 13, 15].contains(i),
    };
  });

  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<KeranjangProvider>().jumlah;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Container(
          margin: const EdgeInsets.only(right: 8),
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Search Products',
              prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(_isListView ? Icons.grid_view : Icons.list),
            onPressed: () {
              setState(() {
                _isListView = !_isListView;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -8, end: -10),
              badgeStyle: const badges.BadgeStyle(badgeColor: Colors.red),
              badgeContent: Text(
                cartCount.toString(),
                style: const TextStyle(fontFamily: 'TomatoGrotesk', color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
              ),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Buttons
          Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: List.generate(_filters.length, (i) {
                final isSelected = i == _selectedFilter;
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: i < _filters.length - 1 ? 12 : 0),
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedFilter = i),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFFFA500) : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected ? const Color(0xFFFFA500) : const Color(0xFFE0E0E0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            _filters[i],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'TomatoGrotesk',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          // Product Grid or List
          Expanded(
            child: _isListView ? _buildList() : _buildGrid(),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemCount: products.length,
      itemBuilder: (ctx, i) => _buildCard(products[i]),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: products.length,
      itemBuilder: (ctx, i) {
        final p = products[i];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetailScreen(product: p),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFEAEAEA)),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1)),
              ],
            ),
            child: Row(
              children: [
                // Image with Add To Cart button
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: Container(
                    width: 120,
                    color: const Color(0xFFF8F8F8),
                    child: Column(
                      children: [
                        // Image area
                        Container(
                          height: 120,
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Image.asset(
                                  p['image'],
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Positioned(
                                top: 4,
                                left: 4,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.favorite_border,
                                      size: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Add To Cart button
                        Padding(
                          padding: const EdgeInsets.fromLTRB(6, 0, 6, 8),
                          child: Container(
                            width: double.infinity,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: const Text(
                                'Add To Cart',
                                style: TextStyle(
                                  fontFamily: 'TomatoGrotesk',
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Details
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          p['name'],
                          style: const TextStyle(
                            fontFamily: 'TomatoGrotesk',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'FREE Delivery',
                          style: TextStyle(
                            fontFamily: 'TomatoGrotesk',
                            fontSize: 12,
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '\$${(p['price']).toString()}',
                          style: const TextStyle(
                            fontFamily: 'TomatoGrotesk',
                            color: Color(0xFFFF1144),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 14, color: Colors.amber),
                            const SizedBox(width: 4),
                            Text(
                              p['rating'].toStringAsFixed(1),
                              style: const TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 12, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: _buildBottomNavItem(Icons.person_outline, 'GENDER'),
          ),
          Container(
            width: 1,
            color: Colors.grey.shade300,
          ),
          Expanded(
            child: _buildBottomNavItem(Icons.arrow_upward, 'SORT'),
          ),
          Container(
            width: 1,
            color: Colors.grey.shade300,
          ),
          Expanded(
            child: _buildBottomNavItem(Icons.filter_list, 'FILTER'),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label) {
    return InkWell(
      onTap: () {
        if (label == 'GENDER') {
          _showGenderModal();
        } else if (label == 'SORT') {
          _showSortModal();
        } else if (label == 'FILTER') {
          _showFilterModal();
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: Colors.black87),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  void _showGenderModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54.withOpacity(0.5),
      builder: (context) {
        final bottomNavHeight = 60.0;
        return Container(
          margin: EdgeInsets.only(bottom: bottomNavHeight),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Gender',
                      style: TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _buildModalButton(
                        'Male',
                        _selectedGender == 'Male',
                        useBlackTextWhenSelected: true,
                        onTap: () {
                          setState(() => _selectedGender = 'Male');
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildModalButton(
                        'Female',
                        _selectedGender == 'Female',
                        useBlackTextWhenSelected: true,
                        onTap: () {
                          setState(() => _selectedGender = 'Female');
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSortModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54.withOpacity(0.5),
      builder: (context) {
        final bottomNavHeight = 60.0;
        return Container(
          margin: EdgeInsets.only(bottom: bottomNavHeight),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'SORT BY',
                      style: TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _buildModalButton(
                        'Necklace',
                        _selectedSort == 'Necklace',
                        useBlackTextWhenSelected: true,
                        onTap: () {
                          setState(() => _selectedSort = 'Necklace');
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildModalButton(
                        'Earrings',
                        _selectedSort == 'Earrings',
                        useBlackTextWhenSelected: true,
                        onTap: () {
                          setState(() => _selectedSort = 'Earrings');
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showFilterModal() {
    final List<String> brands = ['Adidas', 'Reebok', 'Zara', 'Gucci', 'Vogue'];
    final List<String> categories = ['All', 'Child', 'Men', 'Women', 'Dress', 'Jackets', 'Jeans'];
    final List<String> sizes = ['Small', 'Medium', 'Large', 'XL', '2XL'];

    // Ensure lists are initialized - create new lists if needed
    if (_selectedBrands.isEmpty) {
      _selectedBrands = <String>['Adidas'];
    }
    if (_selectedCategories.isEmpty) {
      _selectedCategories = <String>['All'];
    }
    if (_selectedSizes.isEmpty) {
      _selectedSizes = <String>['Small'];
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54.withOpacity(0.5),
      isScrollControlled: true,
      isDismissible: true,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          final bottomNavHeight = 60.0;
          final screenHeight = MediaQuery.of(context).size.height;
          final availableHeight = screenHeight - bottomNavHeight - MediaQuery.of(context).padding.bottom;
          
          return Container(
            margin: EdgeInsets.only(bottom: bottomNavHeight),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            constraints: BoxConstraints(
              maxHeight: availableHeight * 0.9,
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Filters',
                        style: TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Brands Section
                          _buildFilterSection(
                            'Brands',
                            brands,
                            _selectedBrands,
                            (value) {
                              setModalState(() {
                                if (_selectedBrands.contains(value)) {
                                  _selectedBrands.remove(value);
                                } else {
                                  _selectedBrands.add(value);
                                }
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          // Categories Section
                          _buildFilterSection(
                            'Categories',
                            categories,
                            _selectedCategories,
                            (value) {
                              setModalState(() {
                                if (_selectedCategories.contains(value)) {
                                  _selectedCategories.remove(value);
                                } else {
                                  _selectedCategories.add(value);
                                }
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          // Size Section
                          _buildFilterSection(
                            'Size',
                            sizes,
                            _selectedSizes,
                            (value) {
                              setModalState(() {
                                if (_selectedSizes.contains(value)) {
                                  _selectedSizes.remove(value);
                                } else {
                                  _selectedSizes.add(value);
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextButton(
                          onPressed: () {
                            setModalState(() {
                              _selectedBrands = <String>[];
                              _selectedCategories = <String>[];
                              _selectedSizes = <String>[];
                            });
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: const Text(
                            'Reset',
                style: TextStyle(
                  fontFamily: 'TomatoGrotesk',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFA500),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: const Text(
                            'Apply',
                style: TextStyle(
                  fontFamily: 'TomatoGrotesk',
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
        },
      ),
    );
  }

  Widget _buildModalButton(String text, bool isSelected, {required VoidCallback onTap, bool useBlackTextWhenSelected = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFA500) : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? const Color(0xFFFFA500) : Colors.grey.shade300,
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'TomatoGrotesk',
              color: isSelected 
                  ? (useBlackTextWhenSelected ? Colors.black : Colors.white)
                  : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
        ),
      ),
    );
  }

  Widget _buildFilterSection(
    String title,
    List<String> options,
    List<String> selected,
    Function(String) onTap,
  ) {
    // `selected` is already a non-null List<String> (null-safety), so no need
    // to check for null or type. Use it directly.
    final List<String> safeSelected = selected;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'See All',
                style: TextStyle(
                  fontFamily: 'TomatoGrotesk',
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: options.map((option) {
            final isSelected = safeSelected.contains(option);
            return GestureDetector(
              onTap: () => onTap(option),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFFFA500) : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? const Color(0xFFFFA500) : Colors.grey.shade300,
                  ),
                ),
                child: Text(
                  option,
                  style: TextStyle(
                    fontFamily: 'TomatoGrotesk',
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCard(Map<String, dynamic> p) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: p),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFEAEAEA)),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1)),
          ],
        ),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image area with light background
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                child: Container(
                  color: const Color(0xFFF8F8F8),
                  height: 250,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Image.asset(
                      p['image'],
                      fit: BoxFit.contain,
                      height: 240,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              if (p['powered'] == true)
                Positioned(
                  top: 4,
                  left: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'POWERED',
                      style: TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 8, fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                  ),
                ),
              Positioned(
                top: 4,
                right: 4,
                child: GestureDetector(
                  onTap: () {}, // Prevent tap from propagating to card
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.favorite_border, size: 14, color: Colors.black54),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Details
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(6, 4, 6, 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    p['name'],
                    style: const TextStyle(fontFamily: 'TomatoGrotesk', fontWeight: FontWeight.w600, fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        '\$${(p['price']).toString()}',
                        style: const TextStyle(fontFamily: 'TomatoGrotesk', color: Color(0xFFFF1144), fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      const Icon(Icons.star, size: 11, color: Colors.amber),
                      const SizedBox(width: 1),
                      Text(p['rating'].toStringAsFixed(1), style: const TextStyle(fontFamily: 'TomatoGrotesk', fontSize: 10)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}