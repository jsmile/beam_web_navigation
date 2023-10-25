import 'package:flutter/material.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({Key? key, this.id}) : super(key: key);

  final String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Article $id')),
      body: const Center(child: Text('... An article ...')),
    );
  }
}
