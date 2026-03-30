import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../login/controllers/login_controller.dart';

class OtpController extends GetxController {
  final List<TextEditingController> digitControllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  /// Inline message after a failed verify attempt.
  final showInvalidCodeMessage = false.obs;
  final isVerifying = false.obs;
  final isResending = false.obs;

  String _email = '';

  String get email => _email;

  String get _code => digitControllers.map((c) => c.text).join();

  bool get _isComplete =>
      _code.length == 6 && RegExp(r'^\d{6}$').hasMatch(_code);

  @override
  void onInit() {
    super.onInit();
    final arg = Get.arguments;
    if (arg is String) {
      _email = arg;
    }
    SystemChrome.setSystemUIOverlayStyle(LoginController.lightAuthSystemUi);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (focusNodes.isNotEmpty) {
        focusNodes[0].requestFocus();
      }
    });
  }

  @override
  void onClose() {
    for (final c in digitControllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.onClose();
  }

  /// Single box changed — handles digit, paste, and clears error state.
  void onDigitChanged(int index, String value) {
    if (showInvalidCodeMessage.value) showInvalidCodeMessage.value = false;

    final digitsOnly = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (digitsOnly.isEmpty) {
      digitControllers[index].value = TextEditingValue.empty;
      return;
    }

    if (digitsOnly.length > 1) {
      _distributeFrom(index, digitsOnly);
      return;
    }

    digitControllers[index].text = digitsOnly;
    digitControllers[index].selection =
        const TextSelection.collapsed(offset: 1);

    if (index < 5) {
      focusNodes[index + 1].requestFocus();
    }

    if (_isComplete) {
      verifyOtp();
    }
  }

  void _distributeFrom(int startIndex, String digitsOnly) {
    var pos = 0;
    for (var i = startIndex; i < 6 && pos < digitsOnly.length; i++) {
      digitControllers[i].text = digitsOnly[pos];
      digitControllers[i].selection =
          const TextSelection.collapsed(offset: 1);
      pos++;
    }
    final lastFilled = (startIndex + pos - 1).clamp(0, 5);
    focusNodes[lastFilled].requestFocus();
    if (_isComplete) {
      verifyOtp();
    }
  }

  /// Backspace on an empty cell: move to previous and clear it.
  void onBackspaceOnEmpty(int index) {
    if (showInvalidCodeMessage.value) showInvalidCodeMessage.value = false;
    if (index <= 0) return;
    digitControllers[index - 1].clear();
    focusNodes[index - 1].requestFocus();
  }

  void clearAllDigits() {
    for (final c in digitControllers) {
      c.clear();
    }
    if (focusNodes.isNotEmpty) {
      focusNodes[0].requestFocus();
    }
  }

  Future<void> verifyOtp() async {
    if (!_isComplete || isVerifying.value) return;
    isVerifying.value = true;
    try {
      // TODO: replace with real API — e.g. POST /auth/verify-otp
      await Future<void>.delayed(const Duration(milliseconds: 700));
      final code = _code;
      const mockValid = '123456';
      if (code == mockValid) {
        Get.offAllNamed<void>(Routes.SHOP_SETUP_BEGIN);
      } else {
        clearAllDigits();
        showInvalidCodeMessage.value = true;
      }
    } finally {
      isVerifying.value = false;
    }
  }

  Future<void> resendOtp() async {
    if (isResending.value) return;
    isResending.value = true;
    try {
      // TODO: replace with real API — resend OTP to [_email]
      await Future<void>.delayed(const Duration(milliseconds: 600));
    } finally {
      isResending.value = false;
    }
  }

  void goBack() {
    Get.back<void>();
  }

  void backToLogin() {
    Get.offNamed<void>(Routes.LOGIN);
  }
}
