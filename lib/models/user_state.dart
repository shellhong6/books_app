import 'package:meta/meta.dart';

@immutable
class UserInfoState {
  final bool isLogined;

  const UserInfoState({
    this.isLogined = false
  });
}