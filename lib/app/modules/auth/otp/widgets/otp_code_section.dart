import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/otp_controller.dart';
import 'otp_digit_field.dart';

class OtpCodeSection extends StatelessWidget {
  const OtpCodeSection({super.key, required this.controller});

  final OtpController controller;

  static const Color _errBorder = Color(0xFFE53935);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Obx(() {
      final showErr = controller.showInvalidCodeMessage.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              for (var i = 0; i < 6; i++) ...[
                if (i > 0) const SizedBox(width: 8),
                Expanded(
                  child: OtpDigitField(
                    index: i,
                    controller: controller,
                  ),
                ),
              ],
            ],
          ),
          if (showErr) ...[
            const SizedBox(height: 10),
            Text(
              'Invalid code. Please try again.',
              style: textTheme.bodySmall?.copyWith(
                color: _errBorder,
                fontSize: 12,
                height: 1.35,
              ),
            ),
          ],
        ],
      );
    });
  }
}
