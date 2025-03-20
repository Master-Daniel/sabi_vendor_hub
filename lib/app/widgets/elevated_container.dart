import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget elevatedContainer({
  required Widget child,
  double? height,
  double? width,
  Color? bgColor,
}) {
  return Container(
    constraints: height == null ? null : BoxConstraints(minHeight: height),
    width: width,
    decoration: BoxDecoration(
      color: bgColor ?? Get.theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 0.2.r,
          blurRadius: 6.r,
          offset: Offset(0, 0),
        ),
      ],
    ),
    child: child,
  );
}
