import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginLegalFooter extends StatefulWidget {
  const LoginLegalFooter({
    super.key,
    required this.bodyStyle,
    required this.linkStyle,
    required this.onTerms,
    required this.onPrivacy,
  });

  final TextStyle bodyStyle;
  final TextStyle linkStyle;
  final VoidCallback onTerms;
  final VoidCallback onPrivacy;

  @override
  State<LoginLegalFooter> createState() => _LoginLegalFooterState();
}

class _LoginLegalFooterState extends State<LoginLegalFooter> {
  late final TapGestureRecognizer _termsTap;
  late final TapGestureRecognizer _privacyTap;

  @override
  void initState() {
    super.initState();
    _termsTap = TapGestureRecognizer()..onTap = widget.onTerms;
    _privacyTap = TapGestureRecognizer()..onTap = widget.onPrivacy;
  }

  @override
  void dispose() {
    _termsTap.dispose();
    _privacyTap.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: widget.bodyStyle,
        children: [
          const TextSpan(
            text: 'By continuing, you agree to Sabi Vendor Hub\'s\n',
          ),
          TextSpan(
            text: 'Terms of Service',
            style: widget.linkStyle,
            recognizer: _termsTap,
          ),
          TextSpan(
            text: ' and ',
            style: widget.bodyStyle,
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: widget.linkStyle,
            recognizer: _privacyTap,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
