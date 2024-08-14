import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fakestore_ecommerce/providers/product_provider.dart';
import 'package:fakestore_ecommerce/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()..fetchProducts()),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
