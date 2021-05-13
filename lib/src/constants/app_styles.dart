import 'package:flutter/material.dart';

class AppStyles {
  // COLORS
  static final Color lightGrey = Colors.grey.shade200;
  static final Color mediumGrey = Colors.grey.shade800;
  static final Color darkGrey = Colors.grey.shade900;

  // PADDING
  static const EdgeInsets tilePadding = EdgeInsets.fromLTRB(16, 0, 6, 0);

  // THEME
  static final theme = ThemeData(
    primarySwatch: Colors.deepOrange,
    brightness: Brightness.dark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darkGrey,
      foregroundColor: lightGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: BorderSide(
          color: AppStyles.lightGrey,
          width: 2.0,
        ),
      ),
    ),
  );
}
