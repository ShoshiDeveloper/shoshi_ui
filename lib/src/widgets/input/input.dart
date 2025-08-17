import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SInput extends StatefulWidget {
  const SInput({
    this.controller,
    this.prefix,
    this.suffix,
    this.hint,
    this.onTapSuffix,
    this.obscureText = false,
    this.isAutoValidate = true,
    this.isDisabled = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.onSubmitted,
    this.validator,
    super.key,
  }) : assert((maxLines >= minLines), "minLines can't be greater than maxLines");

  final TextEditingController? controller;

  final IconData? prefix;
  final IconData? suffix;
  final VoidCallback? onTapSuffix;
  final String? hint;

  final bool obscureText;
  final bool isAutoValidate;
  final bool isDisabled;

  final int minLines;
  final int maxLines;

  final ValueChanged<String>? onSubmitted;
  final String? Function(String? value)? validator;

  @override
  State<SInput> createState() => _SInputState();
}

class _SInputState extends State<SInput> {
  final focus = FocusNode();
  late final controller = widget.controller ?? TextEditingController();

  @override
  void dispose() {
    focus.dispose();
    if (widget.controller == null) controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final serviceColors = STheme.of(context).serviceColors;
    final bgColors = STheme.of(context).bgColors;
    final textColors = STheme.of(context).textColors;

    return IgnorePointer(
      ignoring: widget.isDisabled,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: focus.requestFocus,
        child: FormField<String>(
          validator: widget.validator,
          builder: (final field) => Opacity(
            opacity: widget.isDisabled ? 0.5 : 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: SSpacings.s16, vertical: SSpacings.s12),
                  decoration: BoxDecoration(
                    color: field.hasError ? serviceColors.danger.light : bgColors.secondary,
                    borderRadius: BorderRadius.circular(SRadii.s12),
                  ),
                  child: Row(
                    spacing: SSpacings.s16,
                    children: [
                      Expanded(
                        child: Row(
                          spacing: SSpacings.s08,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  if (widget.prefix != null) Icon(widget.prefix),
                                  ListenableBuilder(
                                    listenable: focus,
                                    builder: (_, final child) {
                                      return ValueListenableBuilder(
                                        valueListenable: controller,
                                        builder: (_, final value, _) =>
                                            widget.hint != null &&
                                                value.text.isEmpty &&
                                                !focus.hasFocus
                                            ? Text(
                                                widget.hint!,
                                                style: STheme.of(
                                                  context,
                                                ).textStyles.body(color: textColors.secondary),
                                              )
                                            : SizedBox.shrink(),
                                      );
                                    },
                                  ),
                                  Expanded(
                                    child: EditableText(
                                      onTapUpOutside: (_) {
                                        FocusScope.of(context).unfocus();
                                        widget.onSubmitted?.call(controller.text);
                                        field.didChange(controller.text);
                                        if (widget.isAutoValidate) {
                                          Form.maybeOf(context)?.validate();
                                        }
                                      },
                                      controller: controller,
                                      focusNode: focus,
                                      minLines: widget.minLines,
                                      maxLines: widget.maxLines,
                                      style: STheme.of(
                                        context,
                                      ).textStyles.body(color: textColors.primary),
                                      cursorColor: STheme.of(context).textColors.primary,
                                      backgroundCursorColor: Colors.transparent,
                                      obscureText: widget.obscureText,
                                      onSubmitted: (final value) {
                                        widget.onSubmitted?.call(value);
                                        field.didChange(controller.text);
                                        if (widget.isAutoValidate) field.didChange(value);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (widget.suffix != null)
                        GestureDetector(onTap: widget.onTapSuffix, child: Icon(widget.suffix)),
                    ],
                  ),
                ),
                if (field.errorText != null)
                  Text(
                    field.errorText!,
                    style: STheme.of(
                      context,
                    ).textStyles.caption(color: STheme.of(context).serviceColors.danger),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
