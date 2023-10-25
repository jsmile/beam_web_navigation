import 'package:beam_web_navigation/src/nested_navigation_app.dart';
import 'package:flutter/material.dart';

import './src/app_exports.dart';

void main() {
  // Beamer 기본
  // runApp(const BasicApp());

  // WEB 화면처럼 2분할 화면
  // runApp(const TwoDevidedApp());

  // deep navigation
  // runApp(NestedNavigationApp());

  // multi histories accoding to location
  runApp(const MultiBeamersApp());
}
