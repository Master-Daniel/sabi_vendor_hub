import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';
import 'auth_pill_constants.dart';

/// Light auth screen text field: pill shape, white fill, optional leading icon.
///
/// Use [errorText] for validation copy; when non-empty, borders and icon use
/// the error palette.
class AuthPillTextField extends StatelessWidget {
  const AuthPillTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconSize = 22,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.autofillHints,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.style,
    this.cursorColor,
    this.fillColor,
    this.errorText,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final double prefixIconSize;
  final bool autocorrect;
  final bool enableSuggestions;
  final Iterable<String>? autofillHints;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final TextStyle? style;
  final Color? cursorColor;
  final Color? fillColor;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;

  static const Color _errBorder = Color(0xFFE53935);

  bool get _hasError => (errorText ?? '').isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final iconColor = _hasError
        ? _errBorder
        : Colors.black.withValues(alpha: 0.45);

    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      autofillHints: autofillHints,
      obscureText: obscureText,
      readOnly: readOnly,
      enabled: enabled,
      maxLines: maxLines,
      minLines: minLines,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onEditingComplete: onEditingComplete,
      textAlign: textAlign,
      inputFormatters: inputFormatters,
      style: style ??
          const TextStyle(
            fontSize: 15,
            color: Color(0xFF1A1A1A),
          ),
      cursorColor: cursorColor ?? AppColors.brandPurple,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? AppColors.authFieldFill,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black.withValues(alpha: 0.38),
          fontSize: 15,
        ),
        prefixIcon: prefixIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Icon(
                  prefixIcon,
                  color: iconColor,
                  size: prefixIconSize,
                ),
              ),
        suffixIcon: suffixIcon,
        prefixIconConstraints: prefixIcon == null
            ? null
            : const BoxConstraints(
                minWidth: 48,
                minHeight: 48,
              ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        errorText: _hasError ? errorText : null,
        errorStyle: const TextStyle(
          color: _errBorder,
          fontSize: 12,
          height: 1.35,
        ),
        errorMaxLines: 2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kAuthPillRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kAuthPillRadius),
          borderSide: BorderSide(
            color: _hasError
                ? _errBorder
                : Colors.black.withValues(alpha: 0.06),
            width: _hasError ? 1.2 : 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kAuthPillRadius),
          borderSide: BorderSide(
            color: _hasError
                ? _errBorder
                : AppColors.brandPurple.withValues(alpha: 0.45),
            width: 1.2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kAuthPillRadius),
          borderSide: BorderSide(
            color: Colors.black.withValues(alpha: 0.06),
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kAuthPillRadius),
          borderSide: const BorderSide(
            color: _errBorder,
            width: 1.2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kAuthPillRadius),
          borderSide: const BorderSide(
            color: _errBorder,
            width: 1.2,
          ),
        ),
      ),
    );
  }
}
