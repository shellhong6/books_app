import 'package:flutter/material.dart';

class BlockHeader extends StatelessWidget{

  final String title;
  final bool hasMore;

  BlockHeader(this.title, {this.hasMore=false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 36,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 2,
              height: 12,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(10, 212, 224, 1),
                )
              ),
            ),
            SizedBox(
              width: 3,
            ),
            Expanded(
              child: Text(title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color.fromRGBO(39, 39, 39, 1)
                ),
              ),
            ),
            SizedBox(
              width: 80,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  print('onPressed---');
                },
                textColor: Color.fromRGBO(0, 0, 0, .4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text('查看更多',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(0, 0, 0, 120)
                      ),
                    ),
                    Image.asset('images/gt.png')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}