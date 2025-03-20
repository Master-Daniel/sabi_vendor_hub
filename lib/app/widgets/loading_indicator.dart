import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sabi_vendor_hub_mobile/app/widgets/apptext.dart';

Widget loadingIndicator({String? message, double? size}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SpinKitCircle(
        size: (size ?? 60).sp,
        color: Get.theme.colorScheme.primary,
      ),
      Visibility(
        visible: message != null,
        child: SmallAppText(
          message ?? 'Loading...',
          color: Get.theme.colorScheme.primary,
          fontSize: 14.sp,
        ),
      )
    ],
  );
}
