import 'package:flutter/material.dart';
import 'package:books_app/widgets/image_frame.dart';
import 'package:books_app/widgets/block_header.dart';
import 'package:books_app/common/constants.dart';

class BlockColumnFrame extends StatelessWidget{

  final dynamic module;
  static const double radius = 2.0;
  static const double fontSize = 12;
  static const double icon2Text = 5;
  static const double ImgWidth = 65;
  static const double ImgHeight = 85;
  static const double viewHorizontal = 16;

  BlockColumnFrame(this.module);

  @override
  Widget build(BuildContext context) {
    if (module == null) {
      return SizedBox(
        width: 0,
        height: 0,
      );
    }
    List<Widget> widgets = [BlockHeader(module.title)];
    widgets.addAll(getWidgets(context));
    return Padding(
      padding: EdgeInsets.only(left: viewHorizontal, right: viewHorizontal, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets
      ),
    );
  }

  GestureDetector createItem (List<Widget> children, var item, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteKeys.bookDetail, 
          arguments: <String, Object>{
            'data': item,
          }
        );
      },
      child: Row(
        children: children,
      ),
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
        SizedBox(width: icon2Text),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(items[i].name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                )
              ),
              SizedBox(height: 8),
              Text(items[i].shortDesc,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  height: 1.2,
                  fontSize: fontSize,
                  color: Colors.black26,
                )
              ),
              SizedBox(height: 5),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(items[i].author,
                      style: TextStyle(
                        fontSize: fontSize,
                        color: Colors.black26,
                      )
                    )
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(1.0))
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                      child: Text(
                        items[i].category,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black26,
                        )
                      ),
                    )
                  )
                ],
              ),
            ],
          ),
        )
      ], items[i], context));
      if (i < items.length - 1) {
        widgets.add(SizedBox(height: 20));
      }
    }
    return widgets;
  }
}