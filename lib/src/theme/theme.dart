import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SThemeData {
  SThemeData({
    //colors
    final SServiceColors? serviceColors,
    final SBGColors? bgColors,
    final STextColors? textColors,
    //widgets
    final SButtonStyle? button,
    final STextStyles? textStyles,
    final SToggleStyle? toggleStyle,
  }) : serviceColors = SServiceColors.defaults,
       bgColors = SBGColors.defaults,
       textColors = STextColors.defaults,
       //widgets
       buttonStyle = button ?? SButtonStyle.defaults,
       textStyles = textStyles ?? STextStyles.defaults,
       toggleStyle = SToggleStyle.defaults(serviceColors ?? SServiceColors.defaults);

  //colors
  final SServiceColors serviceColors;
  final SBGColors bgColors;
  final STextColors textColors;

  //widgets
  final SButtonStyle buttonStyle;
  final STextStyles textStyles;
  final SToggleStyle toggleStyle;
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
