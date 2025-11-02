class Product {
  final String id;
  final String title;  // ← Diganti dari 'name' jadi 'title'
  final double price;
  final double rating;
  final int reviews;
  final String image;
  final String category;
  final bool isPowered;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.image,
    required this.category,
    this.isPowered = false,
  });
}
