import 'package:flutter/material.dart';
import 'package:books_app/common/constants.dart';

class ImageFrame extends StatelessWidget{

  final String url;
  final double radius;

  ImageFrame({this.url='', this.radius=3.0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: Image.network(
        url,
        fit: BoxFit.fill,
        frameBuilder: (BuildContext context, Widget child, int frame, bool wasSynchronouslyLoaded) {
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              AnimatedOpacity(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.holderColor,
                  )
                ),
                opacity: frame != null ? 0 : 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOut,
              ),
              AnimatedOpacity(
                child: child,
                opacity: frame != null ? 1 : 0,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOut,
              )
            ]
          );
        },
      ),
    );
  }
}