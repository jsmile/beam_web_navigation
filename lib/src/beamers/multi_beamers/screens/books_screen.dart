import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Books')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.beamToNamed('/books/1'),
              child: const Text('Book 1: See details'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => context.beamToNamed('/books/2'),
              child: const Text('Book 2: See details'),
            ),
          ],
        ),
      ),
    );
  }
}
