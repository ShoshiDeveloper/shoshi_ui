import 'package:example/demo/helpers/demo_header.dart';
import 'package:example/demo/helpers/demo_page.dart';
import 'package:example/demo/helpers/demo_section.dart';
import 'package:example/demo/helpers/demo_title.dart';
import 'package:example/demo/utils/context.dart';
import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'Button',
      children: [
        DemoHeader('Default'),
        DemoSection(
          title: DemoTitle('Primary', number: 1),
          demo: SButton('Button', onTap: () => context.showSnackbar('onTap')),
        ),
        DemoSection(
          title: DemoTitle('Secondary', number: 2),
          demo: SButton.secondary('Button', onTap: () => context.showSnackbar('onTap')),
        ),
        DemoSection(
          title: DemoTitle('Text', number: 3),
          demo: SButton.text('Button', onTap: () => context.showSnackbar('onTap')),
        ),
        DemoHeader('With infinity width'),
        DemoSection(
          title: DemoTitle('Primary', number: 4),
          demo: SButton('Button', infinityWidth: true, onTap: () => context.showSnackbar('onTap')),
        ),
        DemoSection(
          title: DemoTitle('Secondary', number: 5),
          demo: SButton.secondary(
            'Button',
            infinityWidth: true,
            onTap: () => context.showSnackbar('onTap'),
          ),
        ),
      ],
    );
  }
}
