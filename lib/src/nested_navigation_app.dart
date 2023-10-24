import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import './beamers/nested_navigation/locations/home_location.dart';

class NestedNavigationApp extends StatelessWidget {
  final BeamerDelegate routeDelegate = BeamerDelegate(
    transitionDelegate: const NoAnimationTransitionDelegate(),
    locationBuilder: (routeInformation, _) => HomeLocation(routeInformation),
  );

  NestedNavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: BeamerParser(),
      routerDelegate: routeDelegate,
    );
  }
}
