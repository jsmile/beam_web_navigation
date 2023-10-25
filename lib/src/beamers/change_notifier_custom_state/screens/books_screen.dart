import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import '../change_notifier_custom_state_exports.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
      ),
      body: ListView(
        children: books
            .map(
              (book) => ListTile(
                title: Text(book.title),
                subtitle: Text(book.author),
                onTap: () {
                  final state = context.currentBeamLocation.state as BooksState;
                  state.selectedBookId = book.id;
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
