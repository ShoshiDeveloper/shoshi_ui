import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SThemeData {
  SThemeData({final SButtonStyle? button, final STextStyles? textStyles})
    : buttonStyle = button ?? SButtonStyle.defaults,
      textStyles = textStyles ?? STextStyles.defaults;

  final SButtonStyle buttonStyle;

  final STextStyles textStyles;
}

class STheme extends StatelessWidget {
  const STheme({required this.data, required this.child, super.key});

  final SThemeData data;

  final Widget child;

  static SThemeData of(final BuildContext context) {
    final inheritedSTheme = context.dependOnInheritedWidgetOfExactType<_InheritedSTheme>();
    if (inheritedSTheme == null) throw Exception("You didn't create STheme before MaterialApp");

    return inheritedSTheme.theme.data;
  }

  @override
  Widget build(final BuildContext context) {
    return _InheritedSTheme(theme: this, child: child);
  }
}

class _InheritedSTheme extends InheritedWidget {
  const _InheritedSTheme({required this.theme, required super.child});

  final STheme theme;

  @override
  bool updateShouldNotify(final _InheritedSTheme oldWidget) => theme != oldWidget.theme;
}
