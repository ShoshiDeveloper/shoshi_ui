import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SSelector<T> extends StatelessWidget {
  const SSelector({
    required this.value,
    required this.values,
    this.stringify,
    this.onChanged,
    this.title,
    super.key,
  });

  final T value;
  final List<T> values;

  final String? title;

  final String Function(T value)? stringify;
  final ValueChanged<T>? onChanged;

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
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
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: SSpacings.s04,
        children: [
          Text(
            stringify?.call(value) ?? value.toString(),
            style: context.theme.textStyles.body(color: context.theme.textColors.secondary),
          ),
          SIcon(icon: SIconsOutlined.rightChevron, size: 16),
        ],
      ),
    );
  }
}
