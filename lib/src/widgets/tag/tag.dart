import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

enum STagVariant { info, warning, danger, success }

class STag extends StatelessWidget {
  const STag({required this.text, this.variant = STagVariant.info, super.key});

  final STagVariant variant;
  final String text;

  @override
  Widget build(final BuildContext context) {
    final contentColors = switch (variant) {
      STagVariant.info => context.theme.colors.text.primary,
      STagVariant.warning => context.theme.colors.service.warning,
      STagVariant.danger => context.theme.colors.service.danger,
      STagVariant.success => context.theme.colors.service.success,
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: SSpacings.s08, vertical: SSpacings.s02),
      decoration: BoxDecoration(
        color: switch (variant) {
          STagVariant.info => context.theme.colors.background.secondary,
          STagVariant.warning => context.theme.colors.service.warning.light,
          STagVariant.danger => context.theme.colors.service.danger.light,
          STagVariant.success => context.theme.colors.service.success.light,
        },
        borderRadius: BorderRadius.circular(SRadii.max),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: SSpacings.s04,
        children: [
          SIcon.filled(icon: SIconsFilled.dangerTriangle, color: contentColors, size: 16),
          Text(
            text,
            style: context.theme.styles.body2(weight: FontWeight.w500, color: contentColors),
          ),
        ],
      ),
    );
  }
}

// class SChipGroup extends StatelessWidget {
//   const SChipGroup({required this.children, this.onChanged, super.key});

//   final List<STag> children;

//   final Function(int index, bool isSelected)? onChanged;

//   @override
//   Widget build(final BuildContext context) {
//     return Wrap(
//       spacing: SSpacings.s04,
//       runSpacing: SSpacings.s04,
//       children: children
//           .mapIndexed(
//             (final idx, final e) => e.copyWith(
//               onChanged: (final isSelected) => onChanged?.call(idx, isSelected),
//             ),
//           )
//           .toList(),
//     );
//   }
// }
