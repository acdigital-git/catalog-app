import 'package:flutter/material.dart';

class AppStyles {
  // COLORS
  static final Color lightGrey = Colors.grey.shade200;
  static final Color mediumGrey = Colors.grey.shade800;

  // PADDING
  static const EdgeInsets tilePadding = EdgeInsets.fromLTRB(16, 0, 6, 0);

  // THEME
  static final theme = ThemeData(
    primarySwatch: Colors.deepOrange,
    brightness: Brightness.dark,
  );
}
