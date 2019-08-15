import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/ticker_provider.dart';
import './home_main.dart';
import '../search/search_btn.dart';
import 'package:books_app/views/bottom_nav_bar/index.dart';
import 'package:books_app/views/active_bottom_nav.dart';
import 'package:books_app/models/bottom_nav.dart';

class HomeRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeRouteState();
  }
}
class HomeRouteState extends State<HomeRoute>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int bottomNavigationBarCurIndex = 1;
  // SwiperController controller = new SwiperController();
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return ActiveBottomNav(
      builder: (BuildContext context, BottomNav activeBottomNav) {
        return Scaffold(
          appBar: new AppBar(
            title: new TabBar(
              tabs: <Widget>[
                new Tab(
                  text: '精选',
                ),
                new Tab(
                  text: '男生',
                ),
                new Tab(
                  text: '女生',
                ),
                new Tab(
                  text: '出版',
                ),
              ],
              controller: _tabController,
            ),
            actions: <Widget>[
              new SearchBtn()
            ],
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 10),
            child: new TabBarView(
              controller: _tabController,
              children: <Widget>[
                new Container(
                  child: HomeMain()
                ),
                new Center(child: new Text('男生')),
                new Center(child: new Text('女生')),
                new Center(child: new Text('出版')),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavBar(),
        );
      }
    );
  }
}