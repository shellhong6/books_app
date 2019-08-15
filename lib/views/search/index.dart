import 'package:flutter/material.dart';

class SearchRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SearchRouteState();
  }
}
class SearchRouteState extends State<SearchRoute> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('搜索'),
      ),
      body: Container(
        child: Center(child: Text('搜索页面'),),
      ),
    );
  }
}