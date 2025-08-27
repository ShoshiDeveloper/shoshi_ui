import 'package:flutter/material.dart';
import 'package:shoshi_ui/src/utils/color_utils.dart';

class SBGColors {
  SBGColors({final Color? primary, final Color? secondary})
    : primary = primary ?? hex('FFFFFF'),
      secondary = secondary ?? hex('F2F2F2');

  final Color primary;
  final Color secondary;
}
