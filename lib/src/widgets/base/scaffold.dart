import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SScaffold extends StatelessWidget {
  const SScaffold({required this.body, super.key, this.appBar, this.padding});

  final PreferredSizeWidget? appBar;
  final EdgeInsets? padding;
  final Widget body;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: context.theme.colors.bgColors.primary,
      body: SafeArea(
        child: Padding(padding: padding ?? EdgeInsets.all(SSpacings.s16), child: body),
      ),
    );
  }
}
