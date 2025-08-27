import 'package:flutter/material.dart';
import 'package:shoshi_ui/src/utils/color_utils.dart';

class SServiceColors {
  SServiceColors({
    final Color? primary,
    final Color? danger,
    final Color? warning,
    final Color? success,
  }) : primary = primary ?? hex('0C8CE9'),
       danger = danger ?? hex('EA3929'),
       warning = warning ?? hex('F68623'),
       success = success ?? hex('018F5D');

  final Color primary;
  final Color danger;
  final Color warning;
  final Color success;
}
