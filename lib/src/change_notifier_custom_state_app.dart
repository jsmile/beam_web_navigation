import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import './beamers/change_notifier_custom_state/books_location.dart';

class ChangeNotifierCustomStateApp extends StatelessWidget {
  final BeamerDelegate routeDelegate = BeamerDelegate(
    locationBuilder: (routeInformation, _) => BooksLocation(routeInformation),
  );

  ChangeNotifierCustomStateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: BeamerParser(),
      routerDelegate: routeDelegate,
    );
  }
}
