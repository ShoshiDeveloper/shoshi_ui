import 'package:flutter/foundation.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

enum SIconStyles { broken, duotone, linear, outlined, filled, boldDuotone }

enum SIcons {
  dangerTriangle,
  shieldWarning,

  check,

  upChevron,
  downChevron,
  leftChevron,
  rightChevron,
  exit,
  plus;

  const SIcons();

  String? getSvg(final SIconStyles style) {
    final str = IconsStorage.icons[name]?.byStyle(style);

    if (str == null) {
      if (kDebugMode) {
        print('Icon not found in storage');
      }
    }

    return str;
  }
}
