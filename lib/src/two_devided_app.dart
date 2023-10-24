import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'beamers/two_devided_screen/landing_screen.dart';

/// App for Two Devided Screen Navigation
class TwoDevidedApp extends StatefulWidget {
  const TwoDevidedApp({super.key});

  @override
  State<TwoDevidedApp> createState() => _TwoDevidedAppState();
}

class _TwoDevidedAppState extends State<TwoDevidedApp> {
  final BeamerDelegate routerDelegate = BeamerDelegate(
    transitionDelegate: const NoAnimationTransitionDelegate(),
    // first Method
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '*': (context, state, data) => const LandingScreen(),
      },
    ),

    // second Method
    // locationBuilder: ( routeInformation, _ ) => HomeLocation( routeInformation ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
    );
  }
}
