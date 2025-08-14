import 'package:flutter/material.dart';
import 'package:shoshi_ui/src/utils/color_utils.dart';

class STextColors {
  const STextColors({
    required this.primary,
    required this.inversePrimary,
    required this.secondary,
    required this.tertiary,
  });
  static final defaults = STextColors(
    primary: hex('2F2F30'),
    inversePrimary: hex('FFFFFF'),
    secondary: hex('666666'),
    tertiary: hex('C2C2C2'),
  );

  final Color primary;
  final Color inversePrimary;
  final Color secondary;
  final Color tertiary;
}
