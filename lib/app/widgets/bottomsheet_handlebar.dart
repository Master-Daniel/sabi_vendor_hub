import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetHandlebar extends StatelessWidget {
  const BottomSheetHandlebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 6.h,
        width: 76.18.w,
        margin:  EdgeInsets.only(top: 8.h, bottom: 16.h),
        decoration: BoxDecoration(
          color: const Color(0xFFE2E2E2),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
