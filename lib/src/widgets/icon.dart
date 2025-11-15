import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SIcon extends StatelessWidget {
  const SIcon({required this.icon, this.size = 24, this.color, super.key});

  final SIconVariant? icon;
  final double size;
  final Color? color;

  @override
  Widget build(final BuildContext context) {
    return icon?.when(
          svg: (final value) => SizedBox(
            height: size,
            width: size,
            child: SvgPicture.string(
              value,
              colorFilter: ColorFilter.mode(
                color ?? context.theme.colors.text.primary,
                BlendMode.srcIn,
              ),
              height: size,
              width: size,
            ),
          ),
          package: (final value, final style) {
            final svg = value?.getSvg(style);

            return svg == null
                ? SizedBox.shrink()
                : SizedBox(
                    height: size,
                    width: size,
                    child: SvgPicture.string(
                      svg,
                      colorFilter: ColorFilter.mode(
                        color ?? context.theme.colors.text.primary,
                        BlendMode.srcIn,
                      ),
                      height: size,
                      width: size,
                    ),
                  );
          },
          material: (final value) => Icon(value, size: size),
        ) ??
        SizedBox.shrink();
  }
}
