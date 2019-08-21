import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:books_app/common/request_util.dart';
import 'package:books_app/remote_models/homepage_list.dart';
import 'package:books_app/common/constants.dart';
import 'package:books_app/widgets/banner_frame.dart';
import 'package:books_app/widgets/entry_frame.dart';
import 'package:books_app/widgets/block_row_frame.dart';
import 'package:books_app/widgets/block_empty_row_frame.dart';
import 'package:books_app/widgets/block_column_frame.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() =>
      new _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {

  SwiperController controller = new SwiperController();
  bool finishRequest = false;
  List<Widget> widgets = [
    BannerFrame(null),
    EntryFrame(null),
    BlockEmptyRowFrame(false)
  ];
  
  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widgets
    );
  }

  initData() async {
    HomepageList homePageList = await getData();
    if (RequestManage.isOk(homePageList)) {
      widgets = [];
      var modules = homePageList.value[0].modules;
      for (var i = 0; i < modules.length; i++) {
        if (modules[i].type == 'banner') {
          widgets.add(BannerFrame(modules[i]));
        } else if (modules[i].type == 'entry') {
          widgets.add(EntryFrame(modules[i]));
        } else if (modules[i].type == 'booklist') {
          if (modules[i].showType == 'row') {
            widgets.add(BlockRowFrame(modules[i]));
          } else if (modules[i].showType == 'column') {
            widgets.add(BlockColumnFrame(modules[i]));
          }
        }
      }
      this.finishRequest = true;
      this.setState((){});
    }
  }

  getData() async {
    try {
      var res = await RequestManage().get(AppApi.homepageList);
      Map<String ,dynamic> map = json.decode(res);
      HomepageList homePageList = HomepageList.fromJson(map);
      return homePageList;
    } catch (err){
      print(err);
      return null;
    }
  }
}