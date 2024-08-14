class Product {
  final int id;
  final String title;
  final double price; // Make sure this is a double
  final String description;
  final String category;
  final String image;
  final double ratingRate; // Change this to double
  final int ratingCount;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratingRate, // Change this to double
    required this.ratingCount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] is int) ? (json['price'] as int).toDouble() : json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      ratingRate: (json['rating']['rate'] is int) ? (json['rating']['rate'] as int).toDouble() : json['rating']['rate'],
      ratingCount: json['rating']['count'],
    );
  }
}
