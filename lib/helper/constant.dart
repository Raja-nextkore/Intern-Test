import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      content: Text(
        title,
      ),
    ),
  );
}
