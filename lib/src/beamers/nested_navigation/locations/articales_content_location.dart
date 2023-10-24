import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';

import '../screens/screens_exports.dart';

class ArticlesContentLocation extends BeamLocation<BeamState> {
  ArticlesContentLocation(RouteInformation routeInformation)
      : super(routeInformation);

  @override
  List<String> get pathPatterns => [
        '/articles/authors',
        '/articles/genres',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('articles-home'),
          title: 'Articles Home',
          child: ArticlesHomeScreen(),
        ),
        if (state.pathPatternSegments.contains('authors'))
          const BeamPage(
            key: ValueKey('articles-authors'),
            title: 'Articles Authors',
            child: ArticleAuthorsScreen(),
          ),
        if (state.pathPatternSegments.contains('genres'))
          const BeamPage(
            key: ValueKey('articles-genres'),
            title: 'Articles Genres',
            child: ArticleGenresScreen(),
          )
      ];
}
