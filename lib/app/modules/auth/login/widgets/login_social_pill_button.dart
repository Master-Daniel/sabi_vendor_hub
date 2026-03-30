import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../widgets/auth_pill_constants.dart';

class LoginSocialPillButton extends StatelessWidget {
  const LoginSocialPillButton({
    super.key,
    required this.label,
    required this.assetPath,
    required this.onPressed,
  });

  final String label;
  final String assetPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.white,
          foregroundColor: const Color(0xFF1A1A1A),
          side: BorderSide(color: Colors.black.withValues(alpha: 0.08)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kAuthPillRadius),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: LayoutBuilder(
            builder: (context, constraints) {
              const gap = 8.0;
              const icon = 22.0;
              final maxLabel =
                  (constraints.maxWidth - gap - icon)
                      .clamp(0.0, double.infinity);
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxLabel),
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: gap),
                  Image.asset(
                    assetPath,
                    width: icon,
                    height: icon,
                    fit: BoxFit.contain,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
