import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  static void show(String? msg) {
    if (msg != null && msg.isNotEmpty) {
      Fluttertoast.showToast(
        msg: msg,
        backgroundColor: Colors.black.withOpacity(0.7),
        textColor: Colors.white,
        fontSize: 16,
      );
    }
  }
}
