import 'package:example/demo/helpers/demo_header.dart';
import 'package:example/demo/helpers/demo_page.dart';
import 'package:example/demo/helpers/demo_section.dart';
import 'package:example/demo/helpers/demo_title.dart';
import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class BottomSheetDemo extends StatefulWidget {
  const BottomSheetDemo({super.key});

  @override
  State<BottomSheetDemo> createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'Toggle',
      children: [
        DemoHeader('Default'),
        DemoSection(
          title: DemoTitle('Active', number: 1),
          demo: Form(
            child: SButton(
              'Open',
              onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                useSafeArea: true,
                builder: (context) => SBottomSheet.scrollable(
                  children: [
                    Column(
                      spacing: SSpacings.s08,
                      children: [
                        SInput(hint: 'Price'),
                        SInput(hint: 'Count'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        DemoSection(
          title: DemoTitle('Not scrollable', number: 2),
          demo: SButton(
            'Open',
            onTap: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              useSafeArea: true,
              builder: (context) => SBottomSheet(
                header: SBottomSheetHeader.title(title: 'Create new product'),
                children: [
                  SInput(hint: 'Price'),
                  SInput(hint: 'Count'),
                ],
                bottom: SButton('Create', infinityWidth: true),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
