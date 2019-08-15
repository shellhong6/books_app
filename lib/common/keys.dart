import 'package:flutter/widgets.dart';

class Keys {
  static final bottomNavBar = const Key('__bottomNavBar__');
  static Key getBottomNavItemKey (bnav) {
    return Key('__bottomNavItem${bnav}__');
  }
}