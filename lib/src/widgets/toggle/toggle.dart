import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SToggle extends StatelessWidget {
  const SToggle({
    required this.value,
    this.isDisabled = false,
    this.onChanged,
    this.validator,
    super.key,
  });

  final FormValidator<bool>? validator;

  final bool value;

  final ValueChanged<bool>? onChanged;

  final bool isDisabled;

  @override
  Widget build(final BuildContext context) {
    late final style = context.theme.widgets.toggle;

    return FormField<bool>(
      validator: validator,
      builder: (_) => GestureDetector(
        onTap: isDisabled ? null : () => onChanged?.call(!value),
        child: Container(
          width: 42,
          height: 26,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: isDisabled ? style.bgDisabled.of(value) : style.bgEnabled.of(value),
            borderRadius: BorderRadius.circular(SRadii.max),
          ),
          child: AnimatedAlign(
            alignment: value ? Alignment.centerRight : Alignment.centerLeft,
            duration: Duration(milliseconds: 100),
            curve: Curves.easeIn,
            child: Container(
              decoration: BoxDecoration(
                color: isDisabled ? style.handleDisabled.of(value) : style.handleEnabled.of(value),
                borderRadius: BorderRadius.circular(SRadii.max),
              ),
              height: 22,
              width: 22,
            ),
          ),
        ),
      ),
    );
  }
}
