import 'package:example/demo/helpers/demo_page.dart';
import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SegmentedListDemo extends StatefulWidget {
  const SegmentedListDemo({super.key});

  @override
  State<SegmentedListDemo> createState() => _SegmentedListDemoState();
}

class _SegmentedListDemoState extends State<SegmentedListDemo> {
  final list = <String>['First', 'Second'];

  late var currItem = list.first;
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'Segmented List',
      children: [
        SSegmentedList(
          children: [
            SSgmentedListItem(title: 'Label'),
            SSgmentedListItem(title: 'Go to next', suffix: SSgmentedListItemSuffix.push()),
            SSgmentedListItem(
              title: 'Select variant',
              suffix: SSgmentedListItemSuffix.selector(
                value: currItem,
                values: list,
                onChanged: (value) => setState(() {
                  currItem = value;
                }),
              ),
            ),
            SSgmentedListItem(
              title: 'Enable',
              suffix: SSgmentedListItemSuffix.toggle(
                value: value,
                onChanged: (value) => setState(() {
                  this.value = value;
                }),
              ),
            ),
          ],
        ),
        // DemoHeader('Default'),
      ],
    );
  }
}
