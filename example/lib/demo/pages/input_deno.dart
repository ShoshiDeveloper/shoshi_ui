import 'package:example/demo/helpers/demo_header.dart';
import 'package:example/demo/helpers/demo_page.dart';
import 'package:example/demo/helpers/demo_section.dart';
import 'package:example/demo/helpers/demo_title.dart';
import 'package:example/demo/utils/context.dart';
import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class InputDemo extends StatefulWidget {
  const InputDemo({super.key});

  @override
  State<InputDemo> createState() => _InputDemoState();
}

class _InputDemoState extends State<InputDemo> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'Input',
      children: [
        DemoHeader('Default'),
        DemoSection(
          title: DemoTitle('Primary', number: 1),
          demo: Form(
            child: SInput(
              controller: controller,
              hint: 'Primary',
              // suffix: SIcons.close,
              onSubmitted: context.showSnackbar,
              onTapSuffix: () {
                context.showSnackbar('onTapSuffix');
                controller.clear();
              },
            ),
          ),
        ),

        DemoSection(
          title: DemoTitle('Error', number: 2),
          demo: Form(
            child: SInput(
              controller: controller,
              hint: '',
              // suffix: Icons.close,
              onSubmitted: context.showSnackbar,
              validator: (value) => value != '0000' ? 'Error text' : null,
              onTapSuffix: () {
                context.showSnackbar('onTapSuffix');
                controller.clear();
              },
            ),
          ),
        ),
        DemoSection(
          title: DemoTitle('Disabled', number: 3),
          demo: Form(
            child: SInput(
              controller: controller,
              hint: 'Disabled',
              // suffix: Icons.close,
              isDisabled: true,
              onSubmitted: context.showSnackbar,
              onTapSuffix: () {
                context.showSnackbar('onTapSuffix');
                controller.clear();
              },
            ),
          ),
        ),
      ],
    );
  }
}
