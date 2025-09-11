import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SSelector<T> extends StatelessWidget {
  const SSelector({
    required this.value,
    required this.values,
    this.stringify,
    this.onChanged,
    this.title,
    this.validator,
    super.key,
  });

  final T value;
  final List<T> values;

  final String? title;

  final String Function(T value)? stringify;
  final ValueChanged<T>? onChanged;

  final FormValidator<T>? validator;

  @override
  Widget build(final BuildContext context) {
    return FormField<T>(
      validator: validator,
      builder: (_) => GestureDetector(
        onTap: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          useSafeArea: true,
          builder: (final context) => SBottomSheet(
            header: title == null
                ? SBottomSheetHeader.handle()
                : SBottomSheetHeader.title(title: title),
            children: [
              SSegmentedList(
                children: values
                    .map(
                      (final e) => SSgmentedListItem(
                        onTap: () {
                          onChanged?.call(e);
                          Navigator.pop(context);
                        },
                        title: stringify?.call(e) ?? e.toString(),
                        suffix: value == e
                            ? SSgmentedListItemSuffix.icon(
                                icon: SIconsOutlined.check,
                                color: context.theme.serviceColors.primary,
                              )
                            : null,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: SSpacings.s16, vertical: SSpacings.s04),
            decoration: BoxDecoration(
              color: context.theme.bgColors.secondary,
              borderRadius: BorderRadius.circular(SRadii.max),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: SSpacings.s08,
              children: [
                Text(
                  stringify?.call(value) ?? value.toString(),
                  style: context.theme.textStyles.body(color: context.theme.textColors.secondary),
                ),
                SIcon(icon: SIconsOutlined.downChevron, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
