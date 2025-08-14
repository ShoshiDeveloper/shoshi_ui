import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class DemoHeader extends StatelessWidget {
  const DemoHeader(this.title, {this.number, super.key});

  final int? number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        "${number != null ? "[$number]" : ''} $title",
        style: STheme.of(context).textStyles.h1(),
      ),
    );
  }
}
