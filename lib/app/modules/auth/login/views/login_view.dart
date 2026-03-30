import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/images.dart';
import '../controllers/login_controller.dart';
import '../widgets/login_continue_email_button.dart';
import '../widgets/login_email_text_field.dart';
import '../widgets/login_legal_footer.dart';
import '../widgets/login_or_divider.dart';
import '../widgets/login_social_pill_button.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final linkStyle = TextStyle(
      color: AppColors.brandPurple,
      fontWeight: FontWeight.w600,
      fontSize: 12,
      height: 1.35,
    );
    final bodyStyle = TextStyle(
      color: Colors.black.withValues(alpha: 0.55),
      fontSize: 12,
      height: 1.45,
    );

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
                              const SizedBox(height: 15),
                              Center(
                                child: Image.asset(
                                  AppImages.sabiLogoDark,
                                  height: 22,
                                  fit: BoxFit.contain,
                                  filterQuality: FilterQuality.high,
                                ),
                              ),
                              const SizedBox(height: 35),
                              Text(
                                'Welcome to Sabi Vendor Hub',
                                textAlign: TextAlign.center,
                                style: textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                  color: const Color(0xFF1A1A1A),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Sign in to your account',
                                textAlign: TextAlign.center,
                                style: textTheme.bodyMedium?.copyWith(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 28),
                              LoginEmailTextField(controller: controller),
                              const SizedBox(height: 16),
                              LoginContinueEmailButton(controller: controller),
                              const SizedBox(height: 28),
                              const LoginOrDivider(),
                              const SizedBox(height: 20),
                              LoginSocialPillButton(
                                label: 'Continue with Apple',
                                assetPath: AppImages.appleLogo,
                                onPressed: controller.onContinueWithApple,
                              ),
                              const SizedBox(height: 12),
                              LoginSocialPillButton(
                                label: 'Continue with Google',
                                assetPath: AppImages.googleLogo,
                                onPressed: controller.onContinueWithGoogle,
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                      LoginLegalFooter(
                        bodyStyle: bodyStyle,
                        linkStyle: linkStyle,
                        onTerms: controller.openTermsOfService,
                        onPrivacy: controller.openPrivacyPolicy,
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
