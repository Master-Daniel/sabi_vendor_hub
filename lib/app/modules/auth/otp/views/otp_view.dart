import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../login/controllers/login_controller.dart';
import '../controllers/otp_controller.dart';
import '../widgets/otp_back_to_login_link.dart';
import '../widgets/otp_code_section.dart';
import '../widgets/otp_resend_button.dart';
import '../widgets/otp_scroll_header.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: LoginController.lightAuthSystemUi,
      child: Scaffold(
        backgroundColor: AppColors.authBackground,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  height: constraints.maxHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              OtpScrollHeader(onBack: controller.goBack),
                              const SizedBox(height: 28),
                              OtpCodeSection(controller: controller),
                            ],
                          ),
                        ),
                      ),
                      OtpResendButton(controller: controller),
                      const SizedBox(height: 14),
                      OtpBackToLoginLink(
                        onPressed: controller.backToLogin,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
