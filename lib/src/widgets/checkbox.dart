import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SCheckbox extends StatelessWidget {
  const SCheckbox({required this.value, this.onChanged, this.validator, super.key});

  final FormValidator<bool>? validator;

  final bool value;

  final ValueChanged<bool>? onChanged;

  @override
  Widget build(final BuildContext context) {
    return FormField<bool>(
      validator: validator,
      builder: (_) => GestureDetector(
        onTap: () => onChanged?.call(!value),
        child: Container(
          height: 24,
          width: 24,
          padding: EdgeInsets.all(SSpacings.s04),
          decoration: BoxDecoration(
            color: value ? context.theme.colors.serviceColors.primary : null,
            borderRadius: BorderRadius.circular(SRadii.max),
            border: !value
                ? Border.all(color: context.theme.colors.textColors.secondary, width: 2)
                : null,
          ),
          child: value
              ? SIcon.outlined(
                  icon: SIconsOutlined.check,
                  color: context.theme.colors.textColors.inversePrimary,
                )
              : null,
        ),
      ),
    );
  }
}
