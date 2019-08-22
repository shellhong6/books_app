import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toast (String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIos: 1,
    backgroundColor: Color.fromRGBO(0, 0, 0, .4),
    textColor: Colors.white,
    fontSize: 12.0
  );
}