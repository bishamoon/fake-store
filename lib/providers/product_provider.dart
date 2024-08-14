import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/clothing_model.dart';
import '../models/electronic_model.dart';
import '../models/jewelry_model.dart';
import '../models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
      print('Response status: ${response.statusCode}'); // Debugging line
      print('Response body: ${response.body}'); // Debugging line

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        _products = data.map<Product>((item) {
          final category = item['category'] as String;
          print('Processing product: $item'); // Debugging line
          switch (category) {
            case 'men\'s clothing':
              return Clothing.fromJson(item);
            case 'electronics':
              return Electronic.fromJson(item);
            case 'jewelery':
              return Jewelry.fromJson(item);
            default:
              return Product.fromJson(item);
          }
        }).toList();

        print('Loaded products: $_products'); // Debugging line
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  List<Product> getProductsByCategory(String category) {
    if (category == 'All') {
      return _products;
    }
    return _products.where((product) => product.category == category).toList();
  }
}
