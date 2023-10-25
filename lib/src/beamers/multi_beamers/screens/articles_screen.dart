import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Articles')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.beamToNamed('/articles/1'),
              child: const Text('Article 1: See details'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => context.beamToNamed('/articles/2'),
              child: const Text('Article 2: See details'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => context.beamToNamed('/articles/3'),
              child: const Text('Article 3: See details'),
            ),
          ],
        ),
      ),
    );
  }
}
