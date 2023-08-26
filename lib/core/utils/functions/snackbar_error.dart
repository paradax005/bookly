import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

SnackBar buildSnackBarError(String message) {
  return SnackBar(
    backgroundColor: Colors.red.shade400,
    content: Text(
      message,
      style: Styles.textStyle16,
    ),
    duration: const Duration(seconds: 2),
  );
}
