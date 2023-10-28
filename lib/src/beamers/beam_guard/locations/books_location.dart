import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import '../beam_guard_exports.dart';

class BooksLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/books/:bookId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        ...HomeLocation().buildPages(context, state),
        if (state.uri.pathSegments.contains('books'))
          const BeamPage(
            key: ValueKey('books'),
            title: 'Books',
            child: BooksScreen(),
          ),
        if (state.pathParameters.containsKey('bookId'))
          BeamPage(
            key: ValueKey('book-${state.pathParameters['bookId']}'),
            title: books.firstWhere((book) =>
                book['id'] == state.pathParameters['bookId'])['title'],
            child: BookDetailsScreen(
              book: books.firstWhere(
                  (book) => book['id'] == state.pathParameters['bookId']),
            ),
          ),
      ];

  final forbiddenPage = const BeamPage(
    key: ValueKey('forbidden'),
    title: 'Forbidden',
    child: Scaffold(
      body: Center(
        child: Text('Forbidden.'),
      ),
    ),
  );

  @override
  List<BeamGuard> get guards => [
        // Show forbiddenPage if the user tries to enter books/2:
        BeamGuard(
          pathPatterns: ['/books/2'],
          check: (context, location) => false,
          showPage: forbiddenPage,
        ),
      ];
}
