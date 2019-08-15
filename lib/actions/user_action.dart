class UserAction {
  final bool isLogined;
  
  UserAction(this.isLogined);

  @override
  String toString(){
    {
      return 'UserAction{isLogined: $isLogined}';
    }
  }
}