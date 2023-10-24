import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'beamers/basic/basic_exports.dart';

// 1. Understanding the boilerplate codes and things needed to start beamer.
//   1.1 Understatnding Code Structure
// 1. beamToNamed() function
// 2. beamTo() function
// 3. beamBack() function
// 4. popToNamed() function
//   4.1. Usage of popRoute() function
//

class BasicApp extends StatefulWidget {
  const BasicApp({super.key});

  @override
  State<BasicApp> createState() => _BasicAppState();
}

class _BasicAppState extends State<BasicApp> {
  final BeamerDelegate routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) => const Home(),
        '/profile': (context, state, data) => const Profile(),
        '/products': (context, state, data) => const Products(),

        // parameter passing
        '/products/:product': (context, state, data) {
          // :product is a parameter
          final String product = state.pathParameters['product']!;

          return BeamPage(
            key: ValueKey('Product-$product'),
            title: 'A Product - $product',
            // popRoute() 에서 사용될 target 경로 정의
            popToNamed: '/product3',
            type: BeamPageType.scaleTransition,
            child: Product(title: product),
          );
        },
      },
    ),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
    );
  }
}
