import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SSpinner extends StatelessWidget {
  const SSpinner.small({super.key}) : size = 16, width = 2;
  const SSpinner.medium({super.key}) : size = 32, width = 4;
  const SSpinner.big({super.key}) : size = 64, width = 6;

  final double size;
  final double width;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: width,
        strokeCap: StrokeCap.round,
        color: context.theme.colors.service.primary,
      ),
    );
  }
}
