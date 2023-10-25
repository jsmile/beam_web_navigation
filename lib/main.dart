import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import './src/app_exports.dart';

void main() {
  Beamer.setPathUrlStrategy();
  // runApp(const BasicApp());
  // runApp(const TwoDevidedApp());
  // runApp(NestedNavigationApp());
  // runApp(LocationBuilderApp());
  runApp(ChangeNotifierCustomStateApp());
}
