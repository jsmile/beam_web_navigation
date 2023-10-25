import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import '../location_bulder_exports.dart';

// OPTION A:
final simpleLocationBuilder = RoutesLocationBuilder(
  routes: {
    '/': (context, state, data) => const BeamPage(
          key: ValueKey('home'),
          title: 'Home',
          child: HomeScreen(),
        ),
    '/books': (context, state, data) => const BeamPage(
          key: ValueKey('books'),
          title: 'Books',
          child: BooksScreen(),
        ),
    '/books/:bookId': (context, state, data) {
      final book = books.firstWhere((book) =>
          book['id'] ==
          (context.currentBeamLocation.state as BeamState)
              .pathParameters['bookId']);

      return BeamPage(
        key: ValueKey('book-${book['id']}'),
        title: book['title'],
        child: BookDetailsScreen(book: book),
      );
    }
  },
);

// OPTION B:
final beamerLocationBuilder = BeamerLocationBuilder(
  beamLocations: [
    BooksLocation(),
  ],
);
