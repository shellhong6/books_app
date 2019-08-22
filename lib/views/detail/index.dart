import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert';
import 'dart:math';
import 'package:books_app/widgets/image_frame.dart';
import 'package:flutter/rendering.dart';
import 'package:books_app/widgets/stretchable_text_view.dart';
import 'package:books_app/remote_models/homepage_list.dart';
import 'package:books_app/common/request_util.dart';
import 'package:books_app/common/constants.dart';
import 'package:books_app/widgets/block_column_frame.dart';

class DetailRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DetailRouteState();
  }
}

class DetailRouteState extends State<DetailRoute>
    with SingleTickerProviderStateMixin {
  dynamic module;
  final double statusBarHeight = 25.0;
  final double headerHeight = 200.0;
  final double descFontSize = 12;
  
  double bannerInfoHeight = 0;

  @override
  void initState() {
    super.initState();
    this.initData();
    bannerInfoHeight = statusBarHeight + 100;
  }

  @override
  Widget build(BuildContext context) {
    dynamic routeParams = ModalRoute.of(context).settings.arguments;
    double viewW = MediaQuery.of(context).size.width;
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: headerHeight,
            flexibleSpace: FlexibleSpaceBar(
              title: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    top: statusBarHeight + 10,
                    child: Text(routeParams["data"].name),
                  )
                ],
              ),
              background: Stack(
                children: <Widget>[
                  Image.network(
                    routeParams["data"].coverUrl,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    height: headerHeight + statusBarHeight,
                    width: viewW,
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: new Container(
                      color: Colors.black.withOpacity(0.5),
                      width: viewW,
                      height: headerHeight + statusBarHeight,
                    ),
                  ),
                  Positioned(
                    left: 80,
                    top: (headerHeight - bannerInfoHeight) / 2 + statusBarHeight,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 80,
                          height: bannerInfoHeight,
                          child: ImageFrame(url: routeParams["data"].coverUrl, radius: 2),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 150,
                              child: Text('名称：${routeParams["data"].name}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white54
                                ),
                                strutStyle: StrutStyle(
                                  leading: .4
                                )
                              ),
                            ),
                            Text('作者：${routeParams["data"].author}',
                              style: TextStyle(color: Colors.white54),
                              strutStyle: StrutStyle(
                                // height: 2,
                                leading: .4
                              )
                            ),
                            Text('类型：${routeParams["data"].category}',
                              style: TextStyle(color: Colors.white54),
                              strutStyle: StrutStyle(
                                // height: 2,
                                leading: .4
                              )
                            ),
                            Text(routeParams["data"].endStatus == 'updating' ? '连载中...' : '完结',
                              style: TextStyle(color: Colors.white54),
                              strutStyle: StrutStyle(
                                // height: 2,
                                leading: .4
                              )
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                StretchableTextView(
                  textStyle: TextStyle(
                    height: 1.2,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  text: routeParams["data"].shortDesc
                )
              ]),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                BlockColumnFrame(module)
              ]),
              // delegate: SliverChildListDelegate(this.cloumnWidgets),
            ),
          ),
        ],
      ),
    );
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

  initData() async {
    HomepageList homePageList = await getData();
    if (RequestManage.isOk(homePageList)) {
      this.module = homePageList.value[0].modules[Random().nextBool() ? 2 : 4];
      this.module.title = '更多好书推荐';
      this.setState((){});
    }
  }
}
