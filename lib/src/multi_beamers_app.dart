import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import './beamers/multi_beamers/screens/home_screen.dart';

class MultiBeamersApp extends StatelessWidget {
  const MultiBeamersApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: BeamerDelegate(
        initialPath: '/books',
        transitionDelegate: const NoAnimationTransitionDelegate(),
        locationBuilder: RoutesLocationBuilder(
          routes: {
            '*': (_, __, ___) => const HomeScreen(),
          },
        ),
      ),
    );
  }
}
