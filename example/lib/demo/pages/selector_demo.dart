import 'package:example/demo/helpers/demo_page.dart';
import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SelectorDemo extends StatefulWidget {
  const SelectorDemo({super.key});

  @override
  State<SelectorDemo> createState() => _SelectorDemoState();
}

class _SelectorDemoState extends State<SelectorDemo> {
  final list = <String>['First', 'Second'];

  late var currItem = list.first;

  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'Selector',
      children: [
        SSelector(
          value: currItem,
          values: list,
          onChanged: (value) => setState(() {
            currItem = value;
          }),
        ),

        SSelector(
          value: currItem,
          values: list,
          title: 'Select one',
          onChanged: (value) => setState(() {
            currItem = value;
          }),
        ),
      ],
    );
  }
}
