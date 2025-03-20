import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sabi_vendor_hub_mobile/app/widgets/apptext.dart';

class LoadingController extends GetxController {
  final _isLoading = false.obs;
  final _message = RxString('');

  bool get isLoading => _isLoading.value;
  String get message => _message.value;

  void showLoading({String? message}) {
    _message.value = message ?? '';
    _isLoading.value = true;
  }

  void hideLoading() {
    _isLoading.value = false;
    _message.value = '';
  }

  void updateMessage(String message) {
    _message.value = message;
  }
}

class TopLoadingOverlay extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Color progressColor;
  final double height;
  final TextStyle? messageStyle;

  const TopLoadingOverlay({
    super.key,
    required this.child,
    this.backgroundColor,
    this.progressColor = Colors.blue,
    this.height = 3.0,
    this.messageStyle,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoadingController>();

    return Stack(
      children: [
        child,
        Obx(() => controller.isLoading
            ? Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LinearProgressIndicator(
                        backgroundColor: backgroundColor ?? Get.theme.colorScheme.surface,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(progressColor),
                        minHeight: height,
                      ),
                      if (controller.message.isNotEmpty)
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 4.h,
                            horizontal: 16.w,
                          ),
                          color: backgroundColor,
                          width: double.infinity,
                          child: SmallAppText(
                            controller.message,
                            alignment: TextAlign.center,
                          ),
                        ),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink()),
      ],
    );
  }
}
