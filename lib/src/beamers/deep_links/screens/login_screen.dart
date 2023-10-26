import 'package:flutter/material.dart';
import '../authenticator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => authenticator.login(),
          child: const Text('Login'),
        ),
      ),
    );
  }
}
