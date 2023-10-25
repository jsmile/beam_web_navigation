import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import './screens_exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool _showArticles;

  final _beamerDelegates = [
    BeamerDelegate(
      initialPath: '/books',
      locationBuilder: RoutesLocationBuilder(
        routes: {
          '/books': (_, __, ___) => const BooksScreen(),
          '/books/:id': (_, state, __) =>
              BookDetailsScreen(id: state.pathParameters['id']),
        },
      ),
    ),
    BeamerDelegate(
      initialPath: '/articles',
      locationBuilder: RoutesLocationBuilder(
        routes: {
          '/articles': (_, __, ___) => const ArticlesScreen(),
          '/articles/:id': (_, state, __) =>
              ArticleDetailsScreen(id: state.pathParameters['id']),
        },
      ),
    ),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final uri = Beamer.of(context).configuration.uri.toString();
    // final uri = Beamer.of(context).configuration.location;
    _showArticles = true; // uri.contains('articles');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Beamers'),
      ),
      backgroundColor: Colors.blue[100],
      body: Stack(
        children: [
          Positioned(
            top: 32.0,
            left: 32.0,
            child: SizedBox(
              width: 320,
              height: 320,
              child: Beamer(routerDelegate: _beamerDelegates[0]),
            ),
          ),
          Positioned(
            bottom: 32.0,
            right: 32.0,
            child: Container(
              width: 240,
              height: 320,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(-2.0, -2.0),
                    blurRadius: 8.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: _showArticles
                  ? Beamer(routerDelegate: _beamerDelegates[1])
                  : Center(
                      child: ElevatedButton(
                        onPressed: () => setState(() => _showArticles = true),
                        child: const Text('Create Beamer'),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
