import 'package:redux/redux.dart';
import 'package:books_app/actions/user_action.dart';
import 'package:books_app/models/user_state.dart';

final userInfoReducer = combineReducers<UserInfoState>([
  TypedReducer<UserInfoState, UserAction>(_updateUserInfo),
]);

UserInfoState _updateUserInfo(userInfo, action) {
  return userInfo;
}
