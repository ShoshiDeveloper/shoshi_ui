import 'package:example/demo/utils/snackbar.dart';
import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  showSnackbar(String text) => ScaffoldMessenger.of(this).showBar(text);
}
