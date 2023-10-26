import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/books_bloc.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BooksBloc>().state;

    return state is BookLoadedState
        ? Scaffold(
            appBar: AppBar(
              title: Text(state.book.title),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Author: ${state.book.author}'),
            ),
          )
        : Scaffold(
            body: Center(
              child: state is BookNotFoundState
                  ? const Text('Book not found')
                  : const CircularProgressIndicator(),
            ),
          );
  }
}
