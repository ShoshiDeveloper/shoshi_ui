import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SToggleStyle {
  const SToggleStyle({
    required this.bgEnabled,
    required this.handleEnabled,
    required this.bgDisabled,
    required this.handleDisabled,
  });

  factory SToggleStyle.defaults(final SServiceColors serviceColors) => SToggleStyle(
    bgEnabled: DualStateStyle(serviceColors.primary, hex('E9E9E9')),
    handleEnabled: DualStateStyle(hex('FFFFFF'), hex('FFFFFF')),
    bgDisabled: DualStateStyle(hex('C2C2C2'), hex('C2C2C2')),
    handleDisabled: DualStateStyle(hex('F4F4F4'), hex('F4F4F4')),
  );

  final DualStateStyle<Color> bgEnabled;
  final DualStateStyle<Color> bgDisabled;

  final DualStateStyle<Color> handleEnabled;
  final DualStateStyle<Color> handleDisabled;
}
