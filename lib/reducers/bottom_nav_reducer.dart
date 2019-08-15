import 'package:redux/redux.dart';
import 'package:books_app/actions/trigger_bottom_nav_bar_action.dart';
import 'package:books_app/models/bottom_nav.dart';

final bottomNavReducer = combineReducers<BottomNav>([
  TypedReducer<BottomNav, TriggerBottomNavBarAction>(_activeTabReducer),
]);

BottomNav _activeTabReducer(BottomNav activeTab, TriggerBottomNavBarAction action) {
  return action.nav;
}