import 'package:example/demo/helpers/demo_page.dart';
import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class TagDemo extends StatefulWidget {
  const TagDemo({super.key});

  @override
  State<TagDemo> createState() => _TagDemoState();
}

class _TagDemoState extends State<TagDemo> {
  bool isSelected = false;

  var chips = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'Tag',
      children: [
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: [
            STag(text: 'Info'),
            STag(text: 'Warning', variant: STagVariant.warning),
            STag(text: 'Danger', variant: STagVariant.danger),
            STag(text: 'Success', variant: STagVariant.success),
          ],
        ),
      ],
    );
  }
}
