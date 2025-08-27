import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SBottomSheetHeader extends StatelessWidget {
  const SBottomSheetHeader.title({required this.title, super.key});
  const SBottomSheetHeader.handle({super.key}) : title = null;

  final String? title;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: SSpacings.s08),
      child: Column(
        spacing: SSpacings.s08,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 32,
            height: 4,
            decoration: BoxDecoration(
              color: context.theme.textColors.tertiary,
              borderRadius: BorderRadius.circular(SRadii.max),
            ),
          ),
          if (title != null)
            Text(title!, style: context.theme.textStyles.t1(weight: FontWeight.w600)),
        ],
      ),
    );
  }
}

sealed class SBottomSheet extends StatelessWidget {
  const SBottomSheet._({
    required this.children,
    this.header = const SBottomSheetHeader.handle(),
    this.bottom,
  });

  // ignore: sort_unnamed_constructors_first
  const factory SBottomSheet({
    required final List<Widget> children,
    final SBottomSheetHeader header,
    final Widget? bottom,
  }) = _SBottomSheetNotScrollable;
  const factory SBottomSheet.scrollable({
    required final List<Widget> children,
    final SBottomSheetHeader header,
    final Widget? bottom,
  }) = _SBottomSheetScrollable;

  final List<Widget> children;
  final SBottomSheetHeader header;
  final Widget? bottom;
}

class _SBottomSheetNotScrollable extends SBottomSheet {
  const _SBottomSheetNotScrollable({required super.children, super.header, super.bottom})
    : super._();

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.only(right: SSpacings.s16, left: SSpacings.s16, bottom: SSpacings.s32),
        decoration: BoxDecoration(
          color: context.theme.bgColors.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SRadii.s16),
            topRight: Radius.circular(SRadii.s16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: SSpacings.s16,
          children: [
            header,
            ListView.separated(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: children.length,
              separatorBuilder: (_, _) => SizedBox(height: SSpacings.s08),
              itemBuilder: (final context, final index) => children[index],
            ),
            ?bottom,
          ],
        ),
      ),
    );
  }
}

class _SBottomSheetScrollable extends SBottomSheet {
  const _SBottomSheetScrollable({required super.children, super.header, super.bottom}) : super._();

  @override
  Widget build(final BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (final context, final scrollController) => Container(
        padding: EdgeInsets.only(right: SSpacings.s16, left: SSpacings.s16, bottom: SSpacings.s32),
        decoration: BoxDecoration(
          color: context.theme.bgColors.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SRadii.s16),
            topRight: Radius.circular(SRadii.s16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: SSpacings.s16,
          children: [
            header,
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                controller: scrollController,
                itemCount: children.length,
                separatorBuilder: (_, _) => SizedBox(height: SSpacings.s08),
                itemBuilder: (final context, final index) => children[index],
              ),
            ),
            ?bottom,
          ],
        ),
      ),
    );
  }
}
