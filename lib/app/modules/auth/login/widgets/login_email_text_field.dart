import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/auth_pill_text_field.dart';
import '../controllers/login_controller.dart';

class LoginEmailTextField extends StatelessWidget {
  const LoginEmailTextField({super.key, required this.controller});

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final err = controller.showEmailError.value;
      return AuthPillTextField(
        controller: controller.emailController,
        hintText: 'Enter Email Address',
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        autofillHints: const [AutofillHints.email],
        textInputAction: TextInputAction.done,
        prefixIcon: Icons.email_outlined,
        errorText:
            err ? 'Please enter a valid email address' : null,
      );
    });
  }
}
