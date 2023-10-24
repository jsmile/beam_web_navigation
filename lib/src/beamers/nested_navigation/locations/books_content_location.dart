import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';

import '../screens/screens_exports.dart';

class BooksContentLocation extends BeamLocation<BeamState> {
  BooksContentLocation(RouteInformation routeInformation)
      : super(routeInformation);

  @override
  List<String> get pathPatterns => [
        '/books/authors',
        '/books/genres',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('books-home'),
          title: 'Books Home',
          child: BooksHomeScreen(),
        ),
        if (state.pathPatternSegments.contains('authors'))
          const BeamPage(
            key: ValueKey('books-authors'),
            title: 'Books Authors',
            child: BookAuthorsScreen(),
          ),
        if (state.pathPatternSegments.contains('genres'))
          const BeamPage(
            key: ValueKey('books-genres'),
            title: 'Books Genres',
            child: BookGenresScreen(),
          )
      ];
}
