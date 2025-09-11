import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SSgmentedListItem extends StatelessWidget {
  const SSgmentedListItem({required this.title, this.suffix, this.onTap, super.key});

  final String title;
  final SSgmentedListItemSuffix? suffix;
  final VoidCallback? onTap;

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          spacing: SSpacings.s08,
          children: [
            Expanded(
              child: Text(
                title,
                style: context.theme.textStyles.body(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ?suffix,
          ],
        ),
      ),
    );
  }
}

sealed class SSgmentedListItemSuffix extends StatelessWidget {
  const factory SSgmentedListItemSuffix.checkbox({
    required final bool value,
    final ValueChanged<bool>? onChanged,
    final FormValidator<bool>? validator,
  }) = _SLISuffixCheckbox;

  const SSgmentedListItemSuffix._();

  const factory SSgmentedListItemSuffix.toggle({
    required final bool value,
    final ValueChanged<bool>? onChanged,
    final bool isDisabled,
    final FormValidator<bool>? validator,
  }) = _SLISuffixToggle;

  const factory SSgmentedListItemSuffix.push() = _SLISuffixPush;

  static SSgmentedListItemSuffix selector<T>({
    required final T value,
    required final List<T> values,
    final String? title,
    final String Function(T value)? stringify,
    final ValueChanged<T>? onChanged,
    final FormValidator<T>? validator,
  }) => _SLISuffixSelector(
    value: value,
    values: values,
    onChanged: onChanged,
    stringify: stringify,
    title: title,
  );

  static SSgmentedListItemSuffix icon({required final SIconData icon, final Color? color}) =>
      _SLISuffixIcon(icon: icon, color: color);
}

final class _SLISuffixToggle extends SSgmentedListItemSuffix {
  const _SLISuffixToggle({
    required this.value,
    this.isDisabled = false,
    this.validator,
    this.onChanged,
  }) : super._();

  final FormValidator<bool>? validator;
  final bool value;
  final ValueChanged<bool>? onChanged;

  final bool isDisabled;
  @override
  Widget build(_) =>
      SToggle(value: value, isDisabled: isDisabled, onChanged: onChanged, validator: validator);
}

final class _SLISuffixPush extends SSgmentedListItemSuffix {
  const _SLISuffixPush() : super._();

  @override
  Widget build(_) => SIcon(icon: SIconsOutlined.rightChevron, size: 16);
}

final class _SLISuffixSelector<T> extends SSgmentedListItemSuffix {
  const _SLISuffixSelector({
    required this.value,
    required this.values,
    this.onChanged,
    this.title,
    this.stringify,
    this.validator,
  }) : super._();

  final FormValidator<T>? validator;
  final T value;
  final List<T> values;

  final String? title;

  final String Function(T value)? stringify;
  final ValueChanged<T>? onChanged;

  @override
  Widget build(_) => SSelector(
    value: value,
    values: values,
    onChanged: onChanged,
    stringify: stringify,
    title: title,
    validator: validator,
  );
}

final class _SLISuffixCheckbox extends SSgmentedListItemSuffix {
  const _SLISuffixCheckbox({required this.value, this.onChanged, this.validator}) : super._();

  final FormValidator<bool>? validator;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(_) => SCheckbox(value: value, onChanged: onChanged, validator: validator);
}

final class _SLISuffixIcon extends SSgmentedListItemSuffix {
  const _SLISuffixIcon({required this.icon, this.color}) : super._();

  final SIconData icon;
  final Color? color;

  @override
  Widget build(_) => SIcon(icon: icon, color: color);
}
