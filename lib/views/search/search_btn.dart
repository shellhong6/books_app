import 'package:flutter/material.dart';
import './index.dart';

class SearchBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) {
            return new SearchRoute();
          })
        );
      },
      child: new Container(
        child: new Icon(Icons.search),
        width: 48,
      )
    );
  }
}