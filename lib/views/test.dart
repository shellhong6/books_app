import 'package:flutter/material.dart';

class Test extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        title: new Text("test"),
      ),
      body: Center(
        child: Text('test'),
      )
    );
  }
}