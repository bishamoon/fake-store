import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fakestore_ecommerce/providers/cart_provider.dart';
import 'package:fakestore_ecommerce/providers/product_provider.dart';
import 'package:fakestore_ecommerce/models/product_model.dart'; // Adjust the import based on your file structure

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    // Convert the List<Product> to Map<int, Product>
    final productMap = {
      for (var product in productProvider.products) product.id: product,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: cartProvider.cartItems.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final productId = cartProvider.cartItems.keys.toList()[index];
                final quantity = cartProvider.cartItems[productId]!;
                final product = productMap[productId] ?? Product(
                  id: -1,
                  title: 'Unknown',
                  category: '',
                  image: '', // Add a default image or placeholder
                  price: 0.0,
                  description: '',
                  ratingRate: 0.0, // Include ratingRate
                  ratingCount: 0, // Include ratingCount
                );

                // Debugging: Print each product and its details
                print('Product: $product, Quantity: $quantity');

                return ListTile(
                  leading: product.image.isNotEmpty
                      ? Image.network(
                          product.image,
                          width: 50,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.error), // Handle image load errors
                        )
                      : SizedBox(width: 50, child: Icon(Icons.image)), // Placeholder for missing image
                  title: Text(product.title),
                  subtitle: Text('Quantity: $quantity'),
                  trailing: Text('\$${product.price * quantity}'),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: \$${cartProvider.getTotalPrice(productMap)}',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle checkout functionality (to be implemented)
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Checkout'),
                    content: Text('Checkout functionality is not implemented yet.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Checkout'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green,
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
