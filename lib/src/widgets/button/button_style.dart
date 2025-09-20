import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SButtonStyle {
  SButtonStyle({
    final Color? enabled,
    final Color? pressed,
    final Color? hovered,
    final Color? disabled,
  }) : enabled = enabled ?? hex('0C8CE9'),
       pressed = pressed ?? hex('0A6BB6'),
       hovered = hovered ?? hex('32A2F1'),
       disabled = disabled ?? hex('C2C2C2');

  final Color enabled;
  final Color pressed;
  final Color hovered;
  final Color disabled;
}
