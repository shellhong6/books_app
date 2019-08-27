import 'package:flutter/material.dart';
import 'package:books_app/widgets/image_frame.dart';
import 'package:books_app/widgets/block_header.dart';
import 'package:books_app/common/constants.dart';

class BlockRowFrame extends StatelessWidget{

  final dynamic module;
  static const double radius = 2.0;
  static const double fontSize = 12;
  static const double icon2Text = 5;
  static const double ImgWidth = 65;
  static const double ImgHeight = 85;
  static const double viewHorizontal = 16;

  BlockRowFrame(this.module);

  @override
  Widget build(BuildContext context) {
    if (module == null) {
      return SizedBox(
        width: 0,
        height: 0,
      );
    }
    return Padding(
      padding: EdgeInsets.only(left: viewHorizontal, right: viewHorizontal, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BlockHeader(module.title),
          Wrap(
            children: getWidgets(context),
            spacing: (MediaQuery.of(context).size.width - 2 * viewHorizontal - 4 * ImgWidth) / 3,
            runSpacing: 10,
          )
        ]
      ),
    );
  }

  SizedBox createItem (List<Widget> children, var item, BuildContext context) {
    return SizedBox(
      height: fontSize * 2 * 1.2 + icon2Text + ImgHeight + 12,
      width: ImgWidth,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RouteKeys.bookDetail, 
            arguments: <String, Object>{
              'data': item,
            }
          );
        },
        child: Column(
          children: children,
        ),
      )
    );
  }

  List<Widget> getWidgets (BuildContext context) {
    List<Widget> widgets = [];
    var items = module.items;
    for (int i = 0; i < items.length; i++) {
      widgets.add(createItem([
        SizedBox(
          width: ImgWidth,
          height: ImgHeight,
          child: ImageFrame(url: items[i].coverUrl, radius: radius),
        ),
        SizedBox(height: icon2Text),
        Text(items[i].name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.black,
          )
        )
      ], items[i], context));
    }
    return widgets;
  }
}