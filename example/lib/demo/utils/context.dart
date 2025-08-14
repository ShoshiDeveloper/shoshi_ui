import 'package:example/demo/utils/snackbar.dart';
import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  Future<T?> push<T>(final Widget page) =>
      Navigator.push<T>(this, MaterialPageRoute(builder: (final context) => page));
  void pop<T>([final T? result]) => Navigator.pop<T>(this, result);

  showSnackbar(String text) => ScaffoldMessenger.of(this).showBar(text);
}
