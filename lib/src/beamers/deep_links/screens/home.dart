import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import '../authenticator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => context.beamToNamed('/home/deeper'),
              child: const Text('Go deeper'),
            ),
            ElevatedButton(
              onPressed: () => authenticator.logout(),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
