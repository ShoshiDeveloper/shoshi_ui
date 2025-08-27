import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({required this.title, required this.children, super.key});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: STheme.of(context).bgColors.primary,
      appBar: AppBar(
        leading: IconButton(onPressed: context.pop, icon: Icon(Icons.chevron_left_rounded)),
        backgroundColor: STheme.of(context).bgColors.primary,
        title: Text(title),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(SSpacings.s16),
        itemBuilder: (context, index) => children[index],
        itemCount: children.length,
        separatorBuilder: (context, index) => SizedBox(height: SSpacings.s08),
      ),
    );
  }
}
