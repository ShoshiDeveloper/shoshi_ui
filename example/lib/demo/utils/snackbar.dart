import 'package:flutter/material.dart';

extension SnackbarX on ScaffoldMessengerState {
  showBar(String text) =>
      showSnackBar(SnackBar(content: Text(text), duration: Duration(milliseconds: 500)));
}
