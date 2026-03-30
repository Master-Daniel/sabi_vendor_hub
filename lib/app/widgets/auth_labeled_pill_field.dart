import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'auth_pill_text_field.dart';

/// [AuthPillTextField] with a label above (no leading icon in the field).
class AuthLabeledPillField extends StatelessWidget {
  const AuthLabeledPillField({
    super.key,
    required this.label,
    required this.controller,
    this.isRequired = false,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.autocorrect = true,
    this.autofillHints,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.errorText,
    this.inputFormatters,
  });

  final String label;
  final TextEditingController controller;
  final bool isRequired;

  static const Color _requiredAsterisk = Color(0xFFE53935);
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autocorrect;
  final Iterable<String>? autofillHints;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FocusNode? focusNode;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        isRequired
            ? Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Color(0xFF1A1A1A),
                  ),
                  children: [
                    TextSpan(text: label),
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(color: _requiredAsterisk),
                    ),
                  ],
                ),
              )
            : Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Color(0xFF1A1A1A),
                ),
              ),
        const SizedBox(height: 8),
        AuthPillTextField(
          controller: controller,
          hintText: hintText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          autocorrect: autocorrect,
          autofillHints: autofillHints,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          focusNode: focusNode,
          errorText: errorText,
          inputFormatters: inputFormatters,
        ),
      ],
    );
  }
}
