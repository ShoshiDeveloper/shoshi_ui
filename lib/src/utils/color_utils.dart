import 'package:flutter/material.dart';

Color rgbo(final int r, final int g, final int b, final double o) => Color.fromRGBO(r, g, b, o);

/// Convert HEX string to Color with RGBA support.
///
/// Example:
/// ```dart
/// Color color = hexToColor("#FF5733FF"); // with aplha
/// ```
Color hex(final String hex) {
  // Remove '#' symbol
  var currHEX = hex.replaceAll('#', '');

  // If string length is 6 symbols then add 'FF' for alpha-channel
  if (currHEX.length == 6) {
    currHEX = 'FF$currHEX';
  }

  // Convert to int with 16 radix
  int val = int.parse(currHEX, radix: 16);

  return Color(val);
}
