import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import '../screens/screens_exports.dart';

class LoginLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/login'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('login'),
          title: 'Login',
          child: LoginScreen(),
        ),
      ];
}
