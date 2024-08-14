import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fakestore_ecommerce/providers/product_provider.dart';
import 'package:fakestore_ecommerce/screens/product_details_screen.dart';

class ProductSearchDelegate extends SearchDelegate<String?> {
  @override
  Widget buildSuggestions(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    final suggestions = provider.products.where((product) {
      final titleLower = product.title.toLowerCase();
      final queryLower = query.toLowerCase();
      return titleLower.contains(queryLower);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final product = suggestions[index];
        return ListTile(
          title: Text(product.title),
          onTap: () {
            showResults(context);
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    final results = provider.products.where((product) {
      final titleLower = product.title.toLowerCase();
      final queryLower = query.toLowerCase();
      return titleLower.contains(queryLower);
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final product = results[index];
        return ListTile(
          title: Text(product.title),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(productId: product.id),
              ),
            );
          },
        );
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
