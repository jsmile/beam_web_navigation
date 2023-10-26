import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import './src/app_exports.dart';
import './src/beamers/deep_links/deep_link_exports.dart';

void main() {
  Beamer.setPathUrlStrategy();

  createAuthenticator();
  createBeamerDelegate();
  // beamerDelegate.setDeepLink('/home/deeper');

  // Beamer 기본
  // runApp(const BasicApp());

  // WEB 화면처럼 2분할 화면
  // runApp(const TwoDevidedApp());

  // runApp(LocationBuilderApp());

  // deep navigation
  // runApp(NestedNavigationApp());

  // multi histories accoding to location
  // runApp(const MultiBeamersApp());

  // Beamer with bloc
  // runApp(BooksBlocApp());

  // Beamer with deep links
  runApp(const DeepLinksApp());
}
