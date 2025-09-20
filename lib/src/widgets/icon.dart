import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

abstract class SIconData {
  String? get getSvg;
}

enum SIconsFilled implements SIconData {
  dangerTriangle,
  shieldWarning,
  success;

  @override
  String? get getSvg => filledIcons[name];
}

enum SIconsOutlined implements SIconData {
  upChevron,
  downChevron,
  leftChevron,
  rightChevron,
  close,
  check,
  plus;

  @override
  String? get getSvg => outlinedIcons[name];
}

class SIcon extends StatelessWidget {
  const SIcon({required SIconData this.icon, this.size = 24, this.color, super.key});
  const SIcon.outlined({required SIconsOutlined this.icon, this.size = 24, this.color, super.key});
  const SIcon.filled({required SIconsFilled this.icon, this.size = 24, this.color, super.key});

  final SIconData? icon;
  final double size;
  final Color? color;

  @override
  Widget build(final BuildContext context) {
    final svgString = icon?.getSvg;
    if (svgString == null) return SizedBox.shrink();

    return SizedBox(
      height: size,
      width: size,
      child: SvgPicture.string(
        svgString,
        colorFilter: ColorFilter.mode(
          color ?? context.theme.colors.textColors.primary,
          BlendMode.srcIn,
        ),
        height: size,
        width: size,
      ),
    );
  }
}
