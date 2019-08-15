import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:books_app/models/main.dart';
import 'package:books_app/models/bottom_nav.dart';

class ActiveBottomNav extends StatelessWidget {
  final ViewModelBuilder<BottomNav> builder;

  ActiveBottomNav({Key key, @required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<MainState, BottomNav>(
      distinct: true,
      converter: (Store<MainState> store) => store.state.activeBottomNav,
      builder: builder,
    );
  }
}
