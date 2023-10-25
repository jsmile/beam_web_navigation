import 'package:flutter/material.dart';

import '../change_notifier_custom_state_exports.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({Key? key, required this.book}) : super(key: key);

  final Book? book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book?.title ?? 'Not Found'),
      ),
      body: book != null
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Author: ${book!.author}'),
            )
          : const SizedBox.shrink(),
    );
  }
}
