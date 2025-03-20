import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget vSpace(double height) {
  return SizedBox(
    height: height.h,
  );
}

Widget hSpace(double width) {
  return SizedBox(
    width: width.w,
  );
}

EdgeInsetsGeometry simPad(double v, double h) {
  return EdgeInsets.symmetric(vertical: v.h, horizontal: h.w);
}

EdgeInsets simMag(double v, double h) {
  return EdgeInsets.symmetric(vertical: v.h, horizontal: h.w);
}


double height(BuildContext context){
  return MediaQuery.of(context).size.height;
}

double width(BuildContext context){
  return MediaQuery.of(context).size.width;
}


