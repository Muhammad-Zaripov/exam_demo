import 'package:flutter/material.dart';

class ThemeHelper {
  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}
