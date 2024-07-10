class Product {
  final String title;
  final String brand;
  final dynamic price;
  final dynamic rating;
  final dynamic reviews;
  final String imageUrl;
  final bool isFavorite;

  Product({
    required this.title,
    required this.brand,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    required this.isFavorite,
  });
}
