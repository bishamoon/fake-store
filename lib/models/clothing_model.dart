import 'product_model.dart';

class Clothing extends Product {
  Clothing({
    required int id,
    required String title,
    required String image,
    required double price,
    required String description,
    required double ratingRate, // Add ratingRate
    required int ratingCount,  // Add ratingCount
  }) : super(
          id: id,
          title: title,
          category: 'Clothing',
          image: image,
          price: price,
          description: description,
          ratingRate: ratingRate, // Initialize ratingRate
          ratingCount: ratingCount, // Initialize ratingCount
        );

  factory Clothing.fromJson(Map<String, dynamic> json) {
    return Clothing(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: (json['price'] is int) ? (json['price'] as int).toDouble() : json['price'].toDouble(),
      description: json['description'],
      ratingRate: (json['rating']['rate'] is int) ? (json['rating']['rate'] as int).toDouble() : json['rating']['rate'].toDouble(),
      ratingCount: json['rating']['count'],
    );
  }
}
