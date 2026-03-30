import 'package:flutter/material.dart';

class OtpScrollHeader extends StatelessWidget {
  const OtpScrollHeader({
    super.key,
    required this.onBack,
  });

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: onBack,
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            ),
            color: const Color(0xFF1A1A1A),
            constraints: const BoxConstraints(
              minWidth: 40,
              minHeight: 40,
            ),
            style: IconButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Enter OTP',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: const Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "We've sent a 6-digit code to your email. Please enter it below to verify your account.",
          style: textTheme.bodyMedium?.copyWith(
            color: Colors.black54,
            fontSize: 12,
            height: 1.45,
          ),
        ),
      ],
    );
  }
}
