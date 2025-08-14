import 'package:flutter/material.dart';
import 'package:shoshi_ui/src/utils/color_utils.dart';

class SServiceColors {
  const SServiceColors({
    required this.primary,
    required this.danger,
    required this.warning,
    required this.success,
  });
  static final defaults = SServiceColors(
    primary: hex('0C8CE9'),
    danger: hex('EA3929'),
    warning: hex('F68623'),
    success: hex('018F5D'),
  );

  final Color primary;
  final Color danger;
  final Color warning;
  final Color success;
}
