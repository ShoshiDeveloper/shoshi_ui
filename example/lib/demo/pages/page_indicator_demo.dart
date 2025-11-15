import 'package:example/demo/helpers/demo_page.dart';
import 'package:example/demo/helpers/demo_section.dart';
import 'package:example/demo/helpers/demo_title.dart';
import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class PageIndicatorDemo extends StatelessWidget {
  const PageIndicatorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'Page Indicator',
      children: [
        DemoSection(
          title: DemoTitle('Small', number: 1),
          demo: SPageIndicator(count: 4, currentIndex: 2),
        ),
      ],
    );
  }
}
