import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import '../screens/screens_exports.dart';

// LOCATIONS
class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('home'),
          title: 'Home',
          child: HomeScreen(),
        ),
      ];
}
