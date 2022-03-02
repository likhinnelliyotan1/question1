 import 'package:flutter/material.dart';

import 'borders.dart';

commonButton({required String name,Color bg= Colors.transparent,Color borderColor=Colors.white,Color txtColor=Colors.white, double paddingH=15,
  double width=240,required Function onTap,double radius=15,
double paddingV=10})
{
  return InkWell(
    onTap: ()=>onTap,
    child: Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: paddingV,horizontal: paddingH),
      
      decoration: getBorder(bgColor: bg,color: borderColor,shadowColor: Colors.transparent,radius: radius),
      child: Center(child: Text(name.toUpperCase(),style: TextStyle(fontFamily: "open_sans_regular",color: txtColor,fontSize: 14),
        textAlign: TextAlign.start,maxLines: 1,)),
    ),
  );
}