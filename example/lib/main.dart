import 'dart:async';

import 'package:example/demo/full_pages/login_demo.dart';
import 'package:example/demo/pages/alert_demo.dart';
import 'package:example/demo/pages/bottom_sheet_demo.dart';
import 'package:example/demo/pages/button_demo.dart';
import 'package:example/demo/pages/chip_demo.dart';
import 'package:example/demo/pages/input_deno.dart';
import 'package:example/demo/pages/segmented_list_demo.dart';
import 'package:example/demo/pages/selector_demo.dart';
import 'package:example/demo/pages/tag_demo.dart';
import 'package:example/demo/pages/toggle_demo.dart';
import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

void main() {
  runZonedGuarded(() {
    runApp(const MyApp());
  }, (error, stack) => print(error));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return STheme(
      data: SThemeData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, Widget> pages = {
    'Button': ButtonDemo(),
    'Toggle': ToggleDemo(),
    'Input': InputDemo(),
    'Alert': AlertDemo(),
    'BottomSheet': BottomSheetDemo(),
    'LoginDemo': LoginDemo(),
    'Selector': SelectorDemo(),
    'SegmentedList': SegmentedListDemo(),
    'Chip': ChipDemo(),
    'Tag': TagDemo(),
  };

  @override
  Widget build(BuildContext context) {
    return SScaffold(
      appBar: SAppBar(title: 'Home'),
      body: Column(
        children: pages.entries
            .map(
              (final e) => GestureDetector(
                onTap: () => context.push(e.value),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: SSpacings.s12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          e.key,
                          style: context.theme.textStyles.body(weight: FontWeight.w500),
                        ),
                      ),
                      Icon(Icons.chevron_right_rounded),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
