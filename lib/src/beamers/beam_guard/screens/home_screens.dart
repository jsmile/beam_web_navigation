import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

// SCREENS
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => context.beamToNamed('/books'),
              child: const Text('Beam to books location'),
            ),
            ElevatedButton(
              onPressed: () => context.beamToNamed('/books/2'),
              child: const Text('Beam to forbidden book'),
            ),
          ],
        ),
      ),
    );
  }
}
