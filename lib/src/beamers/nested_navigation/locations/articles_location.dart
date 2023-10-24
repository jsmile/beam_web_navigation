import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';

import '../screens/screens_exports.dart';

class ArticlesLocation extends BeamLocation<BeamState> {
  ArticlesLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/articles/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('articles'),
          title: 'Articles',
          child: ArticlesScreen(),
        )
      ];
}
