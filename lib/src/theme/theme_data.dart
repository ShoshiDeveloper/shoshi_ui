import 'package:shoshi_ui/shoshi_ui.dart';

class SThemeData {
  factory SThemeData({
    final SThemeColors? colors,
    final STextStyles? textStyles,

    final SButtonStyle? buttonStyle,
    final SToggleStyle? toggleStyle,
  }) {
    final currColors = colors ?? SThemeColors();
    final currTextStyles = textStyles ?? STextStyles.defaults(currColors.text.primary);

    final currWidgets = SThemeWidgets(
      serviceColors: currColors.service,
      textColors: currColors.text,
      button: buttonStyle,
      toggleStyle: toggleStyle,
    );

    return SThemeData._(colors: currColors, styles: currTextStyles, widgets: currWidgets);
  }

  SThemeData._({required this.colors, required this.styles, required this.widgets});

  final SThemeColors colors;

  final STextStyles styles;

  final SThemeWidgets widgets;
}

class SThemeWidgets {
  SThemeWidgets({
    final SServiceColors? serviceColors,
    final STextColors? textColors,

    final SButtonStyle? button,
    final SToggleStyle? toggleStyle,
  }) : button = button ?? SButtonStyle(),
       toggle = SToggleStyle.defaults(serviceColors ?? SServiceColors());

  final SButtonStyle button;

  final SToggleStyle toggle;
}

class SThemeColors {
  SThemeColors({
    final SServiceColors? serviceColors,
    final STextColors? textColors,
    final SBGColors? bgColors,
  }) : service = serviceColors ?? SServiceColors(),
       text = textColors ?? STextColors(),
       background = bgColors ?? SBGColors();

  final SServiceColors service;

  final STextColors text;

  final SBGColors background;
}
