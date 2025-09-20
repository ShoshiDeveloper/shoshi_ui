import 'package:shoshi_ui/shoshi_ui.dart';

class SThemeData {
  factory SThemeData({
    final SThemeColors? colors,
    final STextStyles? textStyles,

    final SButtonStyle? buttonStyle,
    final SToggleStyle? toggleStyle,
  }) {
    final currColors = colors ?? SThemeColors();
    final currTextStyles = textStyles ?? STextStyles.defaults(currColors.serviceColors.primary);

    final currWidgets = SThemeWidgets(
      serviceColors: currColors.serviceColors,
      textColors: currColors.textColors,
      button: buttonStyle,
      toggleStyle: toggleStyle,
    );

    return SThemeData._(colors: currColors, textStyles: currTextStyles, widgets: currWidgets);
  }

  SThemeData._({required this.colors, required this.textStyles, required this.widgets});

  final SThemeColors colors;
  final STextStyles textStyles;

  final SThemeWidgets widgets;
}

class SThemeWidgets {
  SThemeWidgets({
    final SServiceColors? serviceColors,
    final STextColors? textColors,

    final SButtonStyle? button,
    final SToggleStyle? toggleStyle,
  }) : buttonStyle = button ?? SButtonStyle(),
       toggleStyle = SToggleStyle.defaults(serviceColors ?? SServiceColors());
  final SButtonStyle buttonStyle;
  final SToggleStyle toggleStyle;
}

class SThemeColors {
  SThemeColors({
    final SServiceColors? serviceColors,
    final SBGColors? bgColors,
    final STextColors? textColors,
  }) : serviceColors = serviceColors ?? SServiceColors(),
       bgColors = bgColors ?? SBGColors(),
       textColors = textColors ?? STextColors();

  final SServiceColors serviceColors;
  final SBGColors bgColors;
  final STextColors textColors;
}
