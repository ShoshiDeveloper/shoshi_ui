import 'package:example/demo/helpers/demo_header.dart';
import 'package:example/demo/helpers/demo_page.dart';
import 'package:example/demo/helpers/demo_section.dart';
import 'package:example/demo/helpers/demo_title.dart';
import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class AlertDemo extends StatelessWidget {
  const AlertDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const text =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. scrambled it to make a type specimen book.";
    return DemoPage(
      title: 'Alert',
      children: [
        DemoHeader('Default'),
        DemoSection(title: DemoTitle('Info', number: 1), demo: SAlert(text, SAlertStatus.info)),
        DemoSection(
          title: DemoTitle('Warning', number: 1),
          demo: SAlert(text, SAlertStatus.warning),
        ),
        DemoSection(
          title: DemoTitle('Danger', number: 1),
          demo: SAlert(text, SAlertStatus.danger, icon: SIconsFilled.dangerTriangle),
        ),
        DemoSection(
          title: DemoTitle('Success', number: 1),
          demo: SAlert(text, SAlertStatus.success),
        ),
      ],
    );
  }
}
