import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({Key? key, this.id}) : super(key: key);

  final String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book $id')),
      body: const Center(child: Text('... A book ...')),
    );
  }
}
