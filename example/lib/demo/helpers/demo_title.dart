import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class DemoTitle extends StatelessWidget {
  const DemoTitle(this.title, {this.number, super.key});

  final int? number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${number != null ? "[$number]" : ''} $title",
      style: STheme.of(context).styles.t2(),
    );
  }
}
