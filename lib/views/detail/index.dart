import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:books_app/widgets/image_frame.dart';
import 'package:flutter/rendering.dart';
import 'package:books_app/widgets/stretchable_text_view.dart';

class DetailRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DetailRouteState();
  }
}

class DetailRouteState extends State<DetailRoute>
    with SingleTickerProviderStateMixin {
  
  final double statusBarHeight = 25.0;
  final double headerHeight = 200.0;
  final double descFontSize = 12; 
  double bannerInfoHeight = 0;

  @override
  void initState() {
    bannerInfoHeight = statusBarHeight + 100;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double viewW = MediaQuery.of(context).size.width;
    dynamic obj = ModalRoute.of(context).settings.arguments;
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: headerHeight,
            flexibleSpace: FlexibleSpaceBar(
              title: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    top: statusBarHeight + 10,
                    child: Text(obj["data"].name),
                  )
                ],
              ),
              background: Stack(
                children: <Widget>[
                  Image.network(
                    obj["data"].coverUrl,
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
                          child: ImageFrame(url: obj["data"].coverUrl, radius: 2),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 150,
                              child: Text('名称：${obj["data"].name}',
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
                            Text('作者：${obj["data"].author}',
                              style: TextStyle(color: Colors.white54),
                              strutStyle: StrutStyle(
                                // height: 2,
                                leading: .4
                              )
                            ),
                            Text('类型：${obj["data"].category}',
                              style: TextStyle(color: Colors.white54),
                              strutStyle: StrutStyle(
                                // height: 2,
                                leading: .4
                              )
                            ),
                            Text(obj["data"].endStatus == 'updating' ? '连载中...' : '完结',
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
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                StretchableTextView(
                  textStyle: TextStyle(
                    height: 1.2,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  text: obj["data"].shortDesc
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
