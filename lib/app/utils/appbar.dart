import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sabi_vendor_hub_mobile/app/widgets/apptext.dart';


PreferredSizeWidget appBar({
  required String title,
  Widget actionWidget = const SizedBox(),
}) {
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    foregroundColor: Get.theme.colorScheme.onSurface,
    backgroundColor: Get.theme.colorScheme.surface,
    title: MedAppText(
      title,
      fontSize: 14.sp,
    ),
    centerTitle: true,
    actions: [actionWidget],
  );
}
