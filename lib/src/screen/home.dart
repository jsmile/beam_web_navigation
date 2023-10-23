import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Home',
              style: TextStyle(fontSize: 24.0),
            ),
            TextButton(
              child: const Text('Profile'),
              onPressed: () {
                Beamer.of(context).beamToNamed('/profile');
              },
            ),
            TextButton(
              child: const Text('Product'),
              onPressed: () {
                Beamer.of(context).beamToNamed('/products');
              },
            ),
          ],
        ),
      ),
    );
  }
}
