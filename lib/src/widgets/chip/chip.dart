import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

enum SChipSelectedVariant { monochrome, brand }

class SChip extends StatelessWidget {
  const SChip({
    required this.isSelected,
    required this.text,
    this.selectedVariant = SChipSelectedVariant.monochrome,
    this.onChanged,
    this.icon,
    super.key,
  });

  final bool isSelected;
  final SChipSelectedVariant selectedVariant;
  final String text;
  final SIconData? icon;

  final ValueChanged<bool>? onChanged;

  SChip copyWith({final ValueChanged<bool>? onChanged}) {
    return SChip(
      isSelected: isSelected,
      text: text,
      selectedVariant: selectedVariant,
      onChanged: onChanged ?? this.onChanged,
      icon: icon,
      key: key,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged?.call(!isSelected),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: SSpacings.s08,
          vertical: SSpacings.s04,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? switch (selectedVariant) {
                  SChipSelectedVariant.monochrome =>
                    context.theme.textColors.primary,
                  SChipSelectedVariant.brand =>
                    context.theme.serviceColors.primary,
                }
              : context.theme.bgColors.secondary,
          borderRadius: BorderRadius.circular(SRadii.max),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: SSpacings.s08,
          children: [
            if (icon != null)
              SIcon(
                icon: icon!,
                color: isSelected
                    ? context.theme.textColors.inversePrimary
                    : context.theme.textColors.primary,
                size: 16,
              ),
            Text(
              text,
              style: context.theme.textStyles.body2(
                weight: FontWeight.w500,
                color: isSelected
                    ? context.theme.textColors.inversePrimary
                    : context.theme.textColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SChipGroup extends StatelessWidget {
  const SChipGroup({required this.children, this.onChanged, super.key});

  final List<SChip> children;

  final Function(int index, bool isSelected)? onChanged;

  @override
  Widget build(final BuildContext context) {
    return Wrap(
      spacing: SSpacings.s04,
      runSpacing: SSpacings.s04,
      children: children
          .mapIndexed(
            (final idx, final e) => e.copyWith(
              onChanged: (final isSelected) => onChanged?.call(idx, isSelected),
            ),
          )
          .toList(),
    );
  }
}
