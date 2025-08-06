import 'package:flutter/material.dart';

class AppTextStyles {
  // Font family
  static const String fontFamily = 'Inter';

  // Bottom navigation text styles
  static const TextStyle navBarLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );

  static const TextStyle navBarLabelActive = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  // Common text styles
  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );
}
