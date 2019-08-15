import 'package:flutter/material.dart';
import 'package:books_app/widgets/empty_holder.dart';
import 'package:books_app/widgets/image_frame.dart';

class EntryFrame extends StatelessWidget{

  final dynamic entryModule;
  static const double radius = 2.0;
  static const double width = 40;
  static const double height = 40;
  static const double icon2Text = 5;
  static const double fontSize = 12;
  static const double paddingTop = 14;
  static const double paddingBottom = 8;

  EntryFrame(this.entryModule);

  @override
  Widget build(BuildContext context) {
    double containerH = fontSize + icon2Text + 2 + height + paddingTop + paddingBottom;
    return SizedBox(
      height: containerH,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: getWidgets()
        ),
      ),
    );
  }

  Padding createItem (children) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, bottom: paddingBottom, left: 14, right: 14),
      child: SizedBox(
        height: fontSize + icon2Text + 2 + height,
        width: 40,
        child: Column(
          children: children,
        ),
      ),
    );
  }

  List<Widget> getWidgets () {
    List<Widget> widgets = [];
    if (entryModule == null) {
      for (int i = 0; i < 5; i++) {
        widgets.add(createItem([
          EmptyHolder(width, height, radius),
          SizedBox(height: icon2Text),
          Text('xxx',
            style: TextStyle(
              color: Color.fromARGB(50, 0, 0, 0),
              fontSize: fontSize
            )
          )
        ]));
      }
    } else {
      var items = entryModule.items;
      for (int i = 0; i < items.length; i++) {
        widgets.add(createItem([
          SizedBox(
            width: width,
            height: height,
            child: ImageFrame(url: items[i].imgUrl, radius: radius),
          ),
          SizedBox(height: icon2Text),
          Text(items[i].title,
            style: TextStyle(
              fontSize: fontSize
            )
          )
        ]));
      }
    }
    return widgets;
  }
}