import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import 'beamers/deep_links/beamer_delegate.dart';

class DeepLinksApp extends StatelessWidget {
  const DeepLinksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: beamerDelegate,
      routeInformationParser: BeamerParser(),
    );
  }
}
