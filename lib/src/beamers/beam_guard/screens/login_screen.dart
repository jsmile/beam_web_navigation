import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:provider/provider.dart';

import '../authentication_notifier.dart';

// SCREENS
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isAuthenticated =
        Provider.of<AuthenticationNotifier>(context).isAuthenticated;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: isAuthenticated
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Successfully logged in.'),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () => context.beamToNamed('/books'),
                    child: const Text('Beam to books location'),
                  ),
                ],
              )
            : ElevatedButton(
                onPressed: () =>
                    Provider.of<AuthenticationNotifier>(context, listen: false)
                        .login(),
                child: const Text('Login'),
              ),
      ),
    );
  }
}
