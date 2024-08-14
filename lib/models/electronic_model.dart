import 'product_model.dart';

class Electronic extends Product {
  Electronic({
    required int id,
    required String title,
    required String image,
    required double price,
    required String description,
    required double ratingRate, // Add ratingRate as it's part of the Product class
    required int ratingCount, // Add ratingCount as it's part of the Product class
  }) : super(
          id: id,
          title: title,
          category: 'Electronics',
          image: image,
          price: price,
          description: description,
          ratingRate: ratingRate,
          ratingCount: ratingCount,
        );

  factory Electronic.fromJson(Map<String, dynamic> json) {
    return Electronic(
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
