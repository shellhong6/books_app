import 'package:flutter/material.dart';

class StretchableTextView extends StatefulWidget {
  static const double fontSize = 12;
  final int maxLines;
  final TextStyle textStyle;
  final String text;
  final TextSpan spreadBtn;
  StretchableTextView({Key key, this.text, this.maxLines = 3, this.textStyle = const TextStyle(fontSize: fontSize, color: Colors.black), this.spreadBtn}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    return StretchableTextViewState();
  }
}

class StretchableTextViewState extends State<StretchableTextView> {
  List<Widget> shrinkWidgets = [];
  List<Widget> stretchWidgets = [];
  bool _isStrctch = false;
  double minH = 0;
  double maxH = 0;
  double offset = 2;
  @override
  void initState() {
    super.initState();
    TextPainter painter = new TextPainter();
    painter.textDirection = TextDirection.ltr;
    WidgetsBinding.instance.addPostFrameCallback((callback){
      RegExp mulLineSel = new RegExp('(\r)?(\n)');
      final double containerW = this.context.findRenderObject().paintBounds.size.width;
      String _text = widget.text;
      String temp1 = '';
      String temp2 = '';
      painter.maxLines = 1;
      int i = 0;
      while (_text.length != 0) {
        int index = _text.indexOf(mulLineSel);
        temp1 = this.getOneLineText(_text.substring(0, index == -1 ? _text.length : index), containerW, painter, isLast: false);
        stretchWidgets.add(this.createText(temp1));
        if (i < widget.maxLines - 1) {
          shrinkWidgets.add(this.createText(temp1));
        } else if (i == widget.maxLines - 1) {
          temp2 = this.getOneLineText(_text.substring(0, index == -1 ? _text.length : index), containerW, painter, isLast: true);
          shrinkWidgets.add(
            RichText(
              text: this.createTextSpan(temp2, true)
            )
          );
        }
        _text = _text.substring(temp1.length);
        if (index != -1) {
          _text = _text.replaceFirst(mulLineSel, '');
        }
        i++;
      }
      this.setState((){});
    });
  }

  String getOneLineText (String text, double containerW, TextPainter painter, {bool isLast = false}) {
    int i = 1;
    for (;i <= text.length; i++) {
      painter.text = this.createTextSpan(text.substring(0, i), isLast);
      painter.layout();
      if(painter.size.width > containerW){
        return text.substring(0, i - 1);
      }
    }
    return text;
  }

  TextSpan createTextSpan (String text, bool isLast) {
    if (isLast) {
      return TextSpan(
        text: text + '...   ',
        style: widget.textStyle,
        children: [
          widget.spreadBtn??TextSpan(
            text: '更多',
            style: TextStyle(
              color: Colors.blue[200],
              fontSize: (widget.textStyle?.fontSize)??StretchableTextView.fontSize
            ),
          )
        ]
      );
    } else {
      return TextSpan(
        text: text,
        style: widget.textStyle
      );
    }
  }

  SizedBox createText (String text) {
    return SizedBox(
      height: ((widget.textStyle?.fontSize??StretchableTextView.fontSize) * (widget.textStyle?.height)),
      width: this.context.findRenderObject().paintBounds.width,
      child: RichText(
        text: TextSpan(
          text: text,
          style: widget.textStyle
        ),
      ),
      // child: Text(text,
      //   style: widget.textStyle
      // )
    );
  }

  @override
  Widget build(BuildContext context) {
    if (this._isStrctch) {
      return FlatButton(
        color: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        padding: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: stretchWidgets,
        ),
        onPressed: () {
          _isStrctch = false;
          this.setState((){});
        }
      );
    }
    return FlatButton(
      color: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      padding: EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: shrinkWidgets,
      ),
      onPressed: () {
        _isStrctch = true;
        this.setState((){});
      }
    );
  }
}