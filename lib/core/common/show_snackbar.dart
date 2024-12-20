import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = 
    GlobalKey<ScaffoldMessengerState>();

void showSnackbar(String message, {Color? backgroundColor, Duration? duration}) {
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      duration: duration ?? const Duration(seconds: 2),
    ),
  );
}