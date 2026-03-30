import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../widgets/auth_pill_constants.dart';
import '../controllers/otp_controller.dart';

class OtpResendButton extends StatelessWidget {
  const OtpResendButton({super.key, required this.controller});

  final OtpController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final busy = controller.isResending.value;
      return SizedBox(
        height: 52,
        child: ElevatedButton(
          onPressed: busy ? null : controller.resendOtp,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: AppColors.brandPurple,
            foregroundColor: Colors.white,
            disabledBackgroundColor:
                AppColors.brandPurple.withValues(alpha: 0.38),
            disabledForegroundColor:
                Colors.white.withValues(alpha: 0.65),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kAuthPillRadius),
            ),
          ),
          child: busy
              ? const SizedBox(
                  height: 22,
                  width: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : const Text(
                  'Resend OTP',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
        ),
      );
    });
  }
}
