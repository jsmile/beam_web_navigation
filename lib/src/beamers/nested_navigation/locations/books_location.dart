import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';

import '../screens/screens_exports.dart';

// represents a state of a stack of one or more pages.
class BooksLocation extends BeamLocation<BeamState> {
  BooksLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/books/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('books'),
          title: 'Books',
          child: BooksScreen(),
        )
      ];
}
