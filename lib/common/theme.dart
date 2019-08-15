// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/material.dart';

class AppTheme {
  static get theme {
    return ThemeData.light();
    // final originalTextTheme = ThemeData.light().textTheme;
    // final originalBody1 = originalTextTheme.body1;

    // return ThemeData.light().copyWith(
    //   primaryColor: Colors.grey[50],
    //   accentColor: Colors.cyan[300],
    //   bottomAppBarColor: Colors.black,
    //   buttonColor: Colors.black,
    //   textSelectionColor: Colors.cyan[100],
    //   backgroundColor: Colors.grey[100],
    //   toggleableActiveColor: Colors.cyan[300],
    //   textTheme: originalTextTheme.copyWith(
    //     body1:
    //       originalBody1.copyWith(decorationColor: Colors.black)
    //   )
    // );
  }
}
