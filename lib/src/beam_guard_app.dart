import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:provider/provider.dart';

import './beamers/beam_guard/beam_guard_exports.dart';

class BeamGuardApp extends StatelessWidget {
  final routerDelegate = BeamerDelegate(
    setBrowserTabTitle: true,
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        HomeLocation(),
        LoginLocation(),
        BooksLocation(),
      ],
    ),
    guards: [
      // Guard /books and /books/* by beaming to /login if the user is unauthenticated:
      BeamGuard(
        guardNonMatching: true,
        pathPatterns: ['/books', '/books/*'], // 보호받을 경로 선언
        check: (context, location) =>
            context.read<AuthenticationNotifier>().isAuthenticated,
        beamToNamed: (_, __) => '/login',
      ),
    ],
  );

  BeamGuardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthenticationNotifier(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: routerDelegate,
        routeInformationParser: BeamerParser(),
      ),
    );
  }
}
