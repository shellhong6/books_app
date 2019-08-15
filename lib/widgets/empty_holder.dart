import 'package:flutter/material.dart';
import 'package:books_app/common/constants.dart';

class EmptyHolder extends StatelessWidget{

  final double width;
  final double height;
  final double radius;

  EmptyHolder(this.width, this.height, this.radius);

  @override
  Widget build(BuildContext context) {
    BoxDecoration bd = BoxDecoration(
      color: AppColors.holderColor,
      borderRadius: BorderRadius.all(Radius.circular(radius))
    );
    if (width < 0 || height < 0) {
      return LayoutBuilder(
        builder: (context, constrains){
          return Container(
            width: constrains.maxWidth,
            height: constrains.maxHeight,
            decoration: bd
          ); 
        }
      );
    }
    return Container(
      width: width,
      height: height,
      decoration: bd
    );
  }
}