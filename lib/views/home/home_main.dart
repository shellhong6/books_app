import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:books_app/common/request_util.dart';
import 'package:books_app/remote_models/homepage_list.dart';
import 'package:books_app/common/constants.dart';
import 'package:books_app/widgets/banner_frame.dart';
import 'package:books_app/widgets/entry_frame.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() =>
      new _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {

  SwiperController controller = new SwiperController();
  Modules bannerModule;
  Modules entryModule;
  
  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          BannerFrame(bannerModule),
          EntryFrame(entryModule)
        ],
      ),
    );
  }

  initData() async {
    HomepageList homePageList = await getData();
    if (RequestManage.isOk(homePageList)) {
      var _bannerModule;
      var _entryModule;
      var modules = homePageList.value[0].modules;
      for (var i = 0; i < modules.length; i++) {
        if (modules[i].type == 'banner') {
          _bannerModule = modules[i];
          modules.removeAt(i);
          i--;
        } else if (modules[i].type == 'entry') {
          _entryModule = modules[i];
          modules.removeAt(i);
          i--;
        }
      }
      this.setState(() {
        this.bannerModule = _bannerModule;
        this.entryModule = _entryModule;
      });
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