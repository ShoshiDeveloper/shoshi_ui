import 'package:example/demo/helpers/demo_header.dart';
import 'package:example/demo/helpers/demo_page.dart';
import 'package:example/demo/helpers/demo_section.dart';
import 'package:example/demo/helpers/demo_title.dart';
import 'package:example/demo/utils/context.dart';
import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class ToggleDemo extends StatelessWidget {
  const ToggleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'Toggle',
      children: [
        DemoHeader('Default'),
        DemoSection(
          title: DemoTitle('Active', number: 1),
          demo: SToggle(value: true, onChanged: (value) => context.showSnackbar(value.toString())),
        ),
        DemoSection(
          title: DemoTitle('Inactive', number: 2),
          demo: SToggle(value: false, onChanged: (value) => context.showSnackbar(value.toString())),
        ),
        DemoHeader('Disabled'),
        DemoSection(
          title: DemoTitle('Active', number: 1),
          demo: SToggle(
            value: true,
            isDisabled: true,
            onChanged: (value) => context.showSnackbar(value.toString()),
          ),
        ),
        DemoSection(
          title: DemoTitle('Inactive', number: 2),
          demo: SToggle(
            value: false,
            isDisabled: true,
            onChanged: (value) => context.showSnackbar(value.toString()),
          ),
        ),
      ],
    );
  }
}
