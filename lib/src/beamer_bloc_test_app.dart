import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import 'beamers/books_bloc/books_location.dart';

class BeamerBlocTestApp extends StatelessWidget {
  final BeamerDelegate _routerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        BooksLocation(),
      ],
    ),
  );

  BeamerBlocTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: _routerDelegate,
    );
  }
}
