import 'package:example/demo/helpers/demo_title.dart';
import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class DemoSection extends StatelessWidget {
  const DemoSection({this.title, required this.demo, super.key});

  final DemoTitle? title;

  final Widget demo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: SSpacings.s04,
      children: [?title, demo],
    );
  }
}
