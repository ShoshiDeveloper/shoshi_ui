import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SButtonStyle {
  const SButtonStyle({required this.enabled, required this.pressed, required this.disabled});
  static final defaults = SButtonStyle(
    enabled: hex('0C8CE9'),
    pressed: hex('0A6BB6'),
    disabled: hex('C2C2C2'),
  );

  final Color enabled;
  final Color pressed;
  final Color disabled;
}
