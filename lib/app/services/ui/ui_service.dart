import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sabi_vendor_hub_mobile/app/widgets/app_elevated_button.dart';
import 'package:sabi_vendor_hub_mobile/app/widgets/apptext.dart';
import 'package:sabi_vendor_hub_mobile/app/widgets/bottomsheet_handlebar.dart';
import 'package:sabi_vendor_hub_mobile/app/widgets/loading_indicator.dart';
import 'package:sabi_vendor_hub_mobile/app/widgets/space.dart';


class UiService {
  Future showLoadingDialog() async {
    return await showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (builder) {
        return Center(
          child: SpinKitCircle(
            color: Get.theme.colorScheme.primary,
            size: 60,
          ),
        );
      },
    );
  }

  Future loadingDialog() {
    return Get.dialog(
      Center(child: loadingIndicator(message: 'loading'.tr)),
      barrierDismissible: false,
    );
  }

  Future showInfoDialog({
    required Widget content,
    bool barrierDismissible = true,
  }) async {
    return await Get.defaultDialog(
      title: '',
      titleStyle: const TextStyle(),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      radius: 10,
      barrierDismissible: barrierDismissible,
      content: Scaffold(
        body: SizedBox(
          width: Get.width * 0.8,
          child: content,
        ),
      ),
    );
  }

  Future showBottomSheet({
    String? title,
    String? description,
    TextEditingController? controller,
    bool isDismissible = true,
    required Widget content,
  }) async {
    return await Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: BottomSheetHandlebar(),
            ),
            title != null
                ? Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: MedAppText(
                          title,
                          color: Get.theme.colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      vSpace(10),
                    ],
                  )
                : const SizedBox(),
            description != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      description,
                      style: const TextStyle(),
                    ),
                  )
                : const SizedBox(),
            content,
          ],
        ),
      ),
      isDismissible: isDismissible,
      isScrollControlled: true,
      backgroundColor: Get.theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
    );
  }

  Future showBottomSheetWithDissmisibleOption({
    String? title,
    String? description,
    required bool isDismissible,
    required Widget content,
  }) async {
    return await Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BottomSheetHandlebar(),
            title != null
                ? Align(
                    alignment: Alignment.center,
                    child: BigAppText(title),
                  )
                : const SizedBox(),
            description != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SmallAppText(title ?? ''),
                  )
                : const SizedBox(),
            content,
          ],
        ),
      ),
      isDismissible: isDismissible,
      isScrollControlled: true,
      backgroundColor: Get.theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
    );
  }

  Future<void> showSuccessSnackBar({required String message}) async {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Get.theme.colorScheme.primary,
      textColor: Get.theme.colorScheme.surface,
      fontSize: 12.0.sp,
    );
  }

  Future showProgressSnackBar({
    required String message,
    AnimationController? progressIndicatorController,
    Duration? duration,
  }) async {
    Get.snackbar(
      'uploading'.tr,
      message,
      borderWidth: 0,
      borderRadius: 10,
      progressIndicatorBackgroundColor: Get.theme.colorScheme.surface,
     /*  progressIndicatorValueColor: const AlwaysStoppedAnimation<Color>(
        AppColors.warning,
      ), */
      progressIndicatorController: progressIndicatorController,
      showProgressIndicator: true,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.only(top: 10.h, left: 20, right: 20),
      backgroundColor: Get.theme.colorScheme.primary,
      colorText: Get.theme.colorScheme.surface,
      duration: duration,
      titleText: MedAppText(
        'uploading'.tr,
        color: Get.theme.colorScheme.surface,
        fontWeight: FontWeight.bold,
      ),
      messageText: SmallAppText(
        message,
        color: Get.theme.colorScheme.surface,
      ),
    );
  }

  Future<void> showErrorSnackBar({required String message}) async {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Get.theme.colorScheme.error,
      textColor: Get.theme.colorScheme.surface,
      fontSize: 12.0.sp,
    );
  }

  Future showLocationDisclosure({
    required void Function()? onAccept,
    required void Function()? onReject,
  }) async {
    return await Get.defaultDialog(
      title: '',
      titleStyle: const TextStyle(),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      radius: 10,
      barrierDismissible: false,
      content: SizedBox(
        width: 343.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BigAppText('location_disclosure_title'.tr,
                textAlign: TextAlign.center),
            vSpace(10),
            SmallAppText(
              'location_disclosure_message'.tr,
              alignment: TextAlign.center,
            ),
            vSpace(20),
            Row(
              children: [
                Visibility(
                  visible: Platform.isAndroid,
                  child: Expanded(
                    child: AppOutlinedButton(
                      title: Platform.isAndroid ? 'reject'.tr : 'cancel'.tr,
                      onPressed: onReject,
                    ),
                  ),
                ), 
                Visibility(
                  visible: Platform.isAndroid,
                  child: hSpace(20),
                ),
                Expanded(
                  child: AppElevatedButton(
                    title: Platform.isAndroid ? 'accept'.tr : 'continue'.tr,
                    onPressed: onAccept,
                  ),
                ), 
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future alertDialog(BuildContext context, String title) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.center,
                child: SmallAppText(
                  title,
                  color: Get.theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'ok'.tr,
                style: TextStyle(
                  color: Get.theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future actionDialog({
    required BuildContext context,
    required String title,
    required Function onOkay,
    Function? onCancel,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.center,
                child: SmallAppText(
                  title,
                  color: Get.theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'close'.tr,
                style: TextStyle(
                  color: Get.theme.colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (onCancel != null) {
                  onCancel();
                } else {
                  Get.back();
                }
              },
              child: Text(
                'ok'.tr,
                style: TextStyle(
                  color: Get.theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
