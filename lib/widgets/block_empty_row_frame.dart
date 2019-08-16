import 'package:flutter/material.dart';
import 'package:books_app/widgets/empty_holder.dart';

class BlockEmptyRowFrame extends StatelessWidget{

  final bool finishRequest;
  double viewWidth;
  static const double radius = 2.0;
  static const double fontSize = 12;
  static const double icon2Text = 5;
  static const double ImgWidth = 65;
  static const double ImgHeight = 85;
  static const double viewHorizontal = 16;

  BlockEmptyRowFrame(this.finishRequest);

  @override
  Widget build(BuildContext context) {
    if (finishRequest) {
      return SizedBox(height: 0, width: 0,);
    }
    viewWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: viewHorizontal, right: viewHorizontal, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 16),
            child: EmptyHolder(MediaQuery.of(context).size.width, 20, 2)
          ),
          Wrap(
            children: getWidgets(),
            spacing: (viewWidth - 2 * viewHorizontal - 4 * ImgWidth) / 3,
            runSpacing: 15,
          )
        ]
      ),
    );
  }

  SizedBox createItem (children) {
    return SizedBox(
      height: fontSize * 2 + icon2Text + ImgHeight,
      width: ImgWidth,
      child: Column(
        children: children,
      ),
    );
  }

  List<Widget> getWidgets () {
    List<Widget> widgets = [];
    for (int i = 0; i < 8; i++) {
      widgets.add(createItem([
        EmptyHolder(ImgWidth, ImgHeight + icon2Text + 12, radius),
        // SizedBox(height: icon2Text),
        // EmptyHolder(ImgWidth, 12, radius),
      ]));
    }
    return widgets;
  }
}