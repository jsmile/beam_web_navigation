import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String title;

  const Product({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
    );
  }
}
