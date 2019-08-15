import 'package:books_app/models/main.dart';
import 'package:books_app/reducers/user_info_reducer.dart';
import 'package:books_app/reducers/bottom_nav_reducer.dart';

MainState mainReducer(MainState state, action){
  return MainState(
    userInfo: userInfoReducer(state.userInfo, action),
    activeBottomNav: bottomNavReducer(state.activeBottomNav, action)
  );
}