import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import './src/app_exports.dart';

void main() {
  // Beamer 기본
  // runApp(const BasicApp());

  // WEB 화면처럼 2분할 화면
  // runApp(const TwoDevidedApp());

  // runApp(LocationBuilderApp());

  // deep navigation
  // runApp(NestedNavigationApp());

  // multi histories accoding to location
  runApp(const MultiBeamersApp());
}
