import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:books_app/models/main.dart';
import 'package:books_app/models/bottom_nav.dart';
import 'package:books_app/common/keys.dart';
import 'package:books_app/actions/trigger_bottom_nav_bar_action.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<MainState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return BottomNavigationBar(
          key: Keys.bottomNavBar,
          backgroundColor: Color.fromARGB(255, 230, 230, 230),
          type: BottomNavigationBarType.fixed,
          currentIndex: BottomNav.values.indexOf(vm.activeBottomNav),
          onTap: vm.onBottomNavSelected,
          items: BottomNav.values.map((bnav) {
            return BottomNavigationBarItem(
              icon: Icon(
                this.getIcon(bnav),
                key: Keys.getBottomNavItemKey(bnav)
              ),
              title: Text(this.getTitle(bnav)),
            );
          }).toList(),
        );
      },
    );
  }

  IconData getIcon (var bnav) {
    List icons = [Icons.home, Icons.whatshot, Icons.share, Icons.book, Icons.person];
    return icons[bnav.index];
  }

  String getTitle (bnav) {
    List titles = ['书架', '精选', '免费', '书库', '我的'];
    return titles[bnav.index];
  }
}

class _ViewModel {
  final BottomNav activeBottomNav;
  final Function(int) onBottomNavSelected;

  _ViewModel({
    @required this.activeBottomNav,
    @required this.onBottomNavSelected,
  });

  static _ViewModel fromStore(Store<MainState> store) {
    return _ViewModel(
      activeBottomNav: store.state.activeBottomNav,
      onBottomNavSelected: (index) {
        store.dispatch(TriggerBottomNavBarAction((BottomNav.values[index])));
      },
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          activeBottomNav == other.activeBottomNav;

  @override
  int get hashCode => activeBottomNav.hashCode;
}
