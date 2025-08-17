import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SScaffold extends StatelessWidget {
  const SScaffold({required this.body, this.appBar, super.key});

  final Widget body;

  final PreferredSizeWidget? appBar;

  @override
  Widget build(final BuildContext context) {
    final theme = STheme.of(context);

    return Scaffold(
      appBar: appBar,
      backgroundColor: theme.bgColors.primary,
      body: SafeArea(
        child: Padding(padding: EdgeInsets.all(SSpacings.s16), child: body),
      ),
    );
  }
}
