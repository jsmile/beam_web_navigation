import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'books_bloc_exports.dart';

// LOCATIONS
class BooksLocation extends BeamLocation<BeamState> {
  late BooksBloc _booksBloc;

  @override
  void initState() {
    super.initState();
    _booksBloc = BooksBloc();
  }

  @override
  void disposeState() {
    _booksBloc.close();
    super.disposeState();
  }

  @override
  void onUpdate() {
    if (state.pathPatternSegments.isEmpty) return;

    final bookId = state.pathParameters.containsKey('bookId')
        ? int.parse(state.pathParameters['bookId']!)
        : null;

    bookId == null
        ? _booksBloc.add(LoadBooksEvent())
        : _booksBloc.add(LoadBookEvent(bookId));
  }

  @override
  Widget builder(BuildContext context, Widget navigator) {
    return BlocProvider.value(
      value: _booksBloc,
      child: navigator,
    );
  }

  @override
  List<String> get pathPatterns => ['/books/:bookId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('home'),
          title: 'Home',
          child: HomeScreen(),
        ),
        if (state.uri.pathSegments.contains('books'))
          const BeamPage(
            key: ValueKey('books'),
            title: 'Books',
            child: BooksScreen(),
          ),
        if (state.pathParameters.containsKey('bookId'))
          BeamPage(
            key: ValueKey('book-${state.pathParameters['bookId']}'),
            title: 'Book Details',
            child: const BookDetailsScreen(),
          ),
      ];
}
