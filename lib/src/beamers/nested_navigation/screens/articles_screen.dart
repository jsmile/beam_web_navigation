import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../locations/locations_exports.dart';
import '../widgets/menu_button.dart';

class ArticlesScreen extends StatelessWidget {
  final _beamerKey = GlobalKey<BeamerState>();

  ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
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
                  uri: '/articles/authors',
                  child: const Text('Article Authors'),
                ),
                const SizedBox(height: 16.0),
                MenuButton(
                  beamer: _beamerKey,
                  uri: '/articles/genres',
                  child: const Text('Article Genres'),
                ),
              ],
            ),
          ),
          Container(width: 1, color: Colors.blue),
          Expanded(
            child: ClipRRect(
              child: Beamer(
                key: _beamerKey,
                routerDelegate: BeamerDelegate(
                  locationBuilder: (routeInformation, _) =>
                      ArticlesContentLocation(routeInformation),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
