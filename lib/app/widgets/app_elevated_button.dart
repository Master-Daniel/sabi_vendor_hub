import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sabi_vendor_hub_mobile/app/widgets/apptext.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.onPressed,
    //required String text,
    this.title,
    this.child,
    this.height,
    this.bgColor,
    this.textColor,
  });
  final void Function()? onPressed;
  final String? title;
  final Widget? child;
  final double? height;
  final Color? bgColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? Get.theme.colorScheme.primary,
        foregroundColor: textColor ?? Get.theme.colorScheme.surface,
        minimumSize: Size(double.infinity, height ?? 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: child ??
          SmallAppText(
            title ?? "",
            color: textColor ?? Get.theme.colorScheme.surface,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    this.onPressed,
    this.title,
    this.child,
    this.padding,
    this.borderColor,
  });
  final void Function()? onPressed;
  final String? title;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: padding,
        side: BorderSide(
            width: 2, color: borderColor ?? Get.theme.colorScheme.primary),
        minimumSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: child ??
          SmallAppText(
            title ?? "",
            color: Get.theme.colorScheme.primary,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
    );
  }
}
