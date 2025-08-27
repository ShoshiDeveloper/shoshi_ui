import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

extension BuildContextX on BuildContext {
  Future<T?> push<T>(final Widget page) =>
      Navigator.push<T>(this, MaterialPageRoute(builder: (final context) => page));
  void pop<T>([final T? result]) => Navigator.pop<T>(this, result);

  SThemeData get theme => STheme.of(this);
}
