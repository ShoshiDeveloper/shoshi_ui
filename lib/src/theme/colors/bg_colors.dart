import 'package:flutter/material.dart';
import 'package:shoshi_ui/src/utils/color_utils.dart';

class SBGColors {
  const SBGColors({required this.primary, required this.secondary});
  static final defaults = SBGColors(primary: hex('FFFFFF'), secondary: hex('F2F2F2'));

  final Color primary;
  final Color secondary;
}
