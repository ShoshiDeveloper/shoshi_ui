import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

enum SButtonVariant { primary, secondary, text }

class SButton extends StatelessWidget {
  const SButton(
    this.text, {
    this.onTap,
    this.isLoading = false,
    this.infinityWidth = false,
    this.isDisabled = false,
    super.key,
  }) : variant = SButtonVariant.primary;
  const SButton.secondary(
    this.text, {
    this.onTap,
    this.isLoading = false,
    this.isDisabled = false,
    this.infinityWidth = false,
    super.key,
  }) : variant = SButtonVariant.secondary;
  const SButton.text(
    this.text, {
    this.onTap,
    this.isLoading = false,
    this.isDisabled = false,
    super.key,
  }) : variant = SButtonVariant.text,
       infinityWidth = false;

  final String text;

  final SButtonVariant variant;

  final bool isLoading;
  final bool isDisabled;
  final bool infinityWidth;

  final VoidCallback? onTap;

  @override
  Widget build(final BuildContext context) {
    if (isLoading) return SSkeleton(width: 120);

    final style = context.theme.widgets.button;

    return SInteractionBuilder(
      onTap: onTap,
      isDisabled: isLoading,
      builder: (_, final state) {
        final color = state.when(
          enabled: style.enabled,
          pressed: style.pressed,
          disabled: style.disabled,
          hovered: style.hovered,
        );

        if (variant == SButtonVariant.text) {
          return Text(text, style: context.theme.styles.textButton(color: color));
        }

        return Container(
          width: infinityWidth ? double.infinity : null,
          padding: const EdgeInsets.symmetric(horizontal: SSpacings.s32, vertical: SSpacings.s12),
          decoration: BoxDecoration(
            color: variant == SButtonVariant.primary ? color : color.withOpacity(0.25),
            borderRadius: BorderRadius.circular(SRadii.s16),
          ),
          alignment: infinityWidth ? Alignment.center : null,
          child: Text(
            text,
            style: STheme.of(
              context,
            ).styles.button(color: variant == SButtonVariant.secondary ? color : Colors.white),
          ),
        );
      },
    );
  }
}
