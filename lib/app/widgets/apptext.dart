// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';


class SmallAppText extends StatelessWidget {
  SmallAppText(this.data,
      {super.key,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.alignment,
      this.overflow,
      this.maxLines,
      this.canCopy,
      this.decoration});
  String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? alignment;
  final bool? canCopy;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        if (canCopy == true) {
          Clipboard.setData(ClipboardData(text: data));
          // UiService().showSuccessSnackBar(message: 'Copied $data to clipboard');
        }
      },
      child: Text(
        data,
        textAlign: alignment,
        style: GoogleFonts.montserrat(
          color: color ?? Get.theme.colorScheme.onSurface,
          fontSize: fontSize?.sp,
          fontWeight: fontWeight,
          decoration: decoration,
          textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: color ?? Get.theme.colorScheme.onSurface,
                fontSize: fontSize?.sp,
                fontWeight: fontWeight,
              ),
        ),
        overflow: overflow ?? TextOverflow.ellipsis,
        maxLines: maxLines ?? 999,
      ),
    );
  }
}

class MedAppText extends StatelessWidget {
  MedAppText(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.overflow,
    this.maxLines,
    this.alignment,
    this.canCopy,
  });
  String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? alignment;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? canCopy;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        if (canCopy == true) {
          Clipboard.setData(ClipboardData(text: data));
          // UiService().showSuccessSnackBar(message: 'Copied $data to clipboard');
        }
      },
      child: Text(
        data,
        style: GoogleFonts.montserrat(
          color: color ?? Get.theme.colorScheme.onSurface,
          fontSize: fontSize?.sp,
          fontWeight: fontWeight ?? FontWeight.normal,
          textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: color ?? Get.theme.colorScheme.onSurface,
                fontSize: fontSize?.sp,
                fontWeight: fontWeight,
              ),
        ),
        textAlign: alignment,
        overflow: overflow ?? TextOverflow.ellipsis,
        maxLines: maxLines ?? 999,
      ),
    );
  }
}

class BigAppText extends StatelessWidget {
  BigAppText(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.canCopy,
  });
  String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final bool? canCopy;

  final TextOverflow? overflow;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        if (canCopy == true) {
          Clipboard.setData(ClipboardData(text: data));
          // UiService().showSuccessSnackBar(message: 'Copied $data to clipboard');
        }
      },
      child: Text(
        data,
        style: GoogleFonts.montserrat(
          color: color ?? Get.theme.colorScheme.onSurface,
          fontSize: fontSize?.sp,
          textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: color ?? Get.theme.colorScheme.onSurface,
                fontSize: fontSize?.sp,
                fontWeight: fontWeight,
              ),
          fontWeight: fontWeight ?? FontWeight.w800,
        ),
        textAlign: textAlign ?? TextAlign.left,
        overflow: overflow ?? TextOverflow.ellipsis,
        maxLines: maxLines ?? 999,
      ),
    );
  }
}
