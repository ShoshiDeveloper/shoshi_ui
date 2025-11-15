import 'package:example/demo/helpers/demo_page.dart';
import 'package:example/demo/helpers/demo_section.dart';
import 'package:example/demo/helpers/demo_title.dart';
import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SpinnerDemo extends StatelessWidget {
  const SpinnerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'Spinner',
      children: [
        DemoSection(title: DemoTitle('Small', number: 1), demo: SSpinner.small()),
        DemoSection(title: DemoTitle('Medium', number: 2), demo: SSpinner.medium()),
        DemoSection(title: DemoTitle('Big', number: 3), demo: SSpinner.big()),
      ],
    );
  }
}
