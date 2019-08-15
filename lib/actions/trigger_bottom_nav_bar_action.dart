import 'package:books_app/models/bottom_nav.dart';

class TriggerBottomNavBarAction {
  final BottomNav nav;

  TriggerBottomNavBarAction(this.nav);

  @override
  String toString() {
    return 'TriggerBottomNavBarAction{activeBottomNav: $nav}';
  }
}