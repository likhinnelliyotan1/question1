import 'package:flutter/material.dart';
import 'package:question1/helper/themedata.dart';

BoxDecoration getBorder({Color color=colorPrimary, double radius=5,double blurRadius=2,Color shadowColor=Colors.grey,Color bgColor=Colors.white})
{
  return BoxDecoration(
      border: Border.all(
        color: color,
      ),
      color: bgColor,
      
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    boxShadow:[ BoxShadow(
      color: shadowColor,
      blurRadius: blurRadius,
    ),]
  );
}