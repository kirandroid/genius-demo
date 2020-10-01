import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Toast {
  void showToast(
          {BuildContext context,
          String message,
          String title,
          Color bgColor}) =>
      Flushbar(
        margin: const EdgeInsets.all(8),
        title: title,
        message: message,
        duration: const Duration(seconds: 2),
        borderRadius: 8,
        isDismissible: true,
        backgroundColor: bgColor ?? Colors.pink,
        flushbarStyle: FlushbarStyle.FLOATING,
        flushbarPosition: FlushbarPosition.BOTTOM,
      )..show(context);
}
