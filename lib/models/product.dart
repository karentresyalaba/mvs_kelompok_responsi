class Product {
  final String image;
  final String title;
  final double price;
  final double rating;
  final bool isPowered;

  Product({
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
    this.isPowered = false,
  });
}