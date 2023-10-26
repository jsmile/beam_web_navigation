import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/books_bloc.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BooksBloc>().state;

    return state is BooksLoadedState
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Books'),
            ),
            body: ListView(
              children: state.books
                  .map(
                    (book) => ListTile(
                      title: Text(book.title),
                      subtitle: Text(book.author),
                      onTap: () => context.beamToNamed('/books/${book.id}'),
                    ),
                  )
                  .toList(),
            ),
          )
        : const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
