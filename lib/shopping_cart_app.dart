import 'package:flutter/material.dart';
import 'package:stateless_lab_exam/shopping_cart_page.dart';

class ShoppingCartApp extends StatelessWidget {
  const ShoppingCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Shopping Cart Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShoppingCartPage(),
    );
  }
}