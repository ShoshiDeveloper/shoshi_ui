import 'dart:async';

import 'package:example/demo/pages/alert_demo.dart';
import 'package:example/demo/pages/button_demo.dart';
import 'package:example/demo/pages/input_deno.dart';
import 'package:example/demo/pages/toggle_demo.dart';
import 'package:example/demo/utils/context.dart';
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

final Map<String, Widget> pages = {
  'Button': ButtonDemo(),
  'Toggle': ToggleDemo(),
  'Input': InputDemo(),
  'Alert': AlertDemo(),
};

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: pages.entries
              .map(
                (final e) => GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => context.push(e.value),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: SSpacings.s12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [SButton.text(e.key), Icon(Icons.chevron_right_rounded)],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
