import 'package:flutter/material.dart';
import 'package:shoshi_ui/src/utils/color_utils.dart';

class STextColors {
  STextColors({
    final Color? primary,
    final Color? inversePrimary,
    final Color? secondary,
    final Color? tertiary,
  }) : primary = primary ?? hex('2F2F30'),
       inversePrimary = inversePrimary ?? hex('FFFFFF'),
       secondary = secondary ?? hex('666666'),
       tertiary = tertiary ?? hex('C2C2C2');

  final Color primary;
  final Color inversePrimary;
  final Color secondary;
  final Color tertiary;
}
