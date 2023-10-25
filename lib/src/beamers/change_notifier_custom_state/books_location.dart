import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import './change_notifier_custom_state_exports.dart';

// BEAM LOCATION
class BooksLocation extends BeamLocation<BooksState> {
  BooksLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  BooksState createState(RouteInformation routeInformation) =>
      BooksState().fromRouteInformation(routeInformation);

  @override
  void initState() {
    super.initState();
    state.addListener(notifyListeners);
  }

  @override
  void updateState(RouteInformation routeInformation) {
    final booksState = BooksState().fromRouteInformation(routeInformation);
    state.updateWith(booksState.isBooksListOn, booksState.selectedBookId);
  }

  @override
  void disposeState() {
    state.removeListener(notifyListeners);
    super.disposeState();
  }

  @override
  List<Pattern> get pathPatterns => ['/books/:bookId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BooksState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('home'),
        child: HomeScreen(),
      ),
      if (state.isBooksListOn)
        const BeamPage(
          key: ValueKey('books'),
          child: BooksScreen(),
        ),
    ];
    if (state.selectedBookId != null) {
      pages.add(
        BeamPage(
          key: ValueKey('book-${state.selectedBookId}'),
          title: 'Book #${state.selectedBookId}',
          child: BookDetailsScreen(book: books[state.selectedBookId!]),
        ),
      );
    }
    return pages;
  }
}
