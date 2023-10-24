import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../locations/locations_exports.dart';
import '../widgets/menu_button.dart';

class HomeScreen extends StatelessWidget {
  final _beamerKey = GlobalKey<BeamerState>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Row(
        children: [
          Container(
            color: Colors.blue[300],
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                MenuButton(
                  beamer: _beamerKey,
                  uri: '/books',
                  child: const Text('Books'),
                ),
                const SizedBox(height: 16.0),
                MenuButton(
                  beamer: _beamerKey,
                  uri: '/articles',
                  child: const Text('Articles'),
                ),
              ],
            ),
          ),
          Container(width: 1, color: Colors.blue),
          if ((context.currentBeamLocation.state as BeamState).uri.path.isEmpty)
            Expanded(
              child: Container(
                child: const Center(
                  child: Text('Home'),
                ),
              ),
            )
          else
            Expanded(
              child: ClipRRect(
                child: Beamer(
                  key: _beamerKey,
                  routerDelegate: BeamerDelegate(
                    transitionDelegate: const NoAnimationTransitionDelegate(),
                    locationBuilder: (routeInformation, _) =>
                        // routeInformation.location.contains('articles')
                        routeInformation.uri.toString().contains('articles')
                            ? ArticlesLocation(routeInformation)
                            : BooksLocation(routeInformation),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
