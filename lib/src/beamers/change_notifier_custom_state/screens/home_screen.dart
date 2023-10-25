import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import '../change_notifier_custom_state_exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final state = context.currentBeamLocation.state as BooksState;
            state.isBooksListOn = true;
          },
          child: const Text('See books'),
        ),
      ),
    );
  }
}
