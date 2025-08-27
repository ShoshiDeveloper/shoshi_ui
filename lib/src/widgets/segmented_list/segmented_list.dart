import 'package:flutter/material.dart';
import 'package:shoshi_ui/src/consts/spacings.dart';
import 'package:shoshi_ui/src/widgets/segmented_list/segmented_list_item.dart';

class SSegmentedList extends StatelessWidget {
  const SSegmentedList({required this.children, super.key});

  final List<SSgmentedListItem> children;

  @override
  Widget build(final BuildContext context) {
    return Column(spacing: SSpacings.s04, children: children);
  }
}
