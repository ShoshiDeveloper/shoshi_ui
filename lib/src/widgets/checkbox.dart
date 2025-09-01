import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SCheckbox extends StatelessWidget {
  const SCheckbox({required this.value, this.onChanged, super.key});

  final bool value;

  final ValueChanged<bool>? onChanged;

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged?.call(!value),
      child: Container(
        height: 24,
        width: 24,
        padding: EdgeInsets.all(SSpacings.s04),
        decoration: BoxDecoration(
          color: value ? context.theme.serviceColors.primary : null,
          borderRadius: BorderRadius.circular(SRadii.max),
          border: !value
              ? Border.all(color: context.theme.textColors.secondary, width: 2)
              : null,
        ),
        child: value
            ? SIcon.outlined(
                icon: SIconsOutlined.check,
                color: context.theme.textColors.inversePrimary,
              )
            : null,
      ),
    );
  }
}
