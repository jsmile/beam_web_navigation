import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import './beamers/location_builder/locations/location_builders.dart';

class LocationBuilderApp extends StatelessWidget {
  final BeamerDelegate routeDelegate = BeamerDelegate(
    // There are three different options of building the locations.
    //
    // OPTION A:
    locationBuilder: simpleLocationBuilder,
    //
    // OPTION B:
    //locationBuilder: beamerLocationBuilder,
    //
    // OPTION C:
    // locationBuilder: (routeInformation) =>
    //     BooksLocation(routeInformation: routeInformation),
  );
  LocationBuilderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: routeDelegate,
      routeInformationParser: BeamerParser(),
    );
  }
}
