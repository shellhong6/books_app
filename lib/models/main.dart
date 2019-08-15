import 'package:meta/meta.dart';
import 'package:books_app/models/user_state.dart';
import 'package:books_app/models/bottom_nav.dart';

@immutable
class MainState {
  final bool isLoading;
  final UserInfoState userInfo;
  final BottomNav activeBottomNav;

  MainState({
    this.isLoading = false,
    this.userInfo = const UserInfoState(),
    this.activeBottomNav = BottomNav.home
  });

  factory MainState.loading() => MainState(isLoading: true);
}