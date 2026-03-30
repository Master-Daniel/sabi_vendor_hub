import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../widgets/auth_pill_constants.dart';
import '../controllers/login_controller.dart';

class LoginContinueEmailButton extends StatelessWidget {
  const LoginContinueEmailButton({super.key, required this.controller});

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final enabled = controller.isEmailValid.value;
      return SizedBox(
        height: 52,
        child: ElevatedButton(
          onPressed:
              enabled ? controller.onContinueWithEmail : null,
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
          child: const Text(
            'Continue with Email',
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
