import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../constants/colors.dart';
import '../controllers/otp_controller.dart';
import 'otp_layout_constants.dart';

class OtpDigitField extends StatefulWidget {
  const OtpDigitField({
    super.key,
    required this.index,
    required this.controller,
  });

  final int index;
  final OtpController controller;

  @override
  State<OtpDigitField> createState() => _OtpDigitFieldState();
}

class _OtpDigitFieldState extends State<OtpDigitField> {
  late final TextEditingController _text;
  late final FocusNode _focus;

  @override
  void initState() {
    super.initState();
    _text = widget.controller.digitControllers[widget.index];
    _focus = widget.controller.focusNodes[widget.index];
    _text.addListener(_onFieldUpdate);
    _focus.addListener(_onFieldUpdate);
  }

  @override
  void dispose() {
    _text.removeListener(_onFieldUpdate);
    _focus.removeListener(_onFieldUpdate);
    super.dispose();
  }

  void _onFieldUpdate() => setState(() {});

  bool get _useBrandBorder =>
      _text.text.isNotEmpty || _focus.hasFocus;

  @override
  Widget build(BuildContext context) {
    final neutralBorder = Colors.black.withValues(alpha: 0.06);
    final borderSide = BorderSide(
      color: _useBrandBorder ? AppColors.brandPurple : neutralBorder,
      width: _useBrandBorder ? 1.5 : 1,
    );
    final outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(kOtpBoxRadius),
      borderSide: borderSide,
    );

    return Focus(
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent) {
          return KeyEventResult.ignored;
        }
        if (event.logicalKey != LogicalKeyboardKey.backspace) {
          return KeyEventResult.ignored;
        }
        if (_text.text.isEmpty) {
          widget.controller.onBackspaceOnEmpty(widget.index);
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: TextField(
        controller: _text,
        focusNode: _focus,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        maxLength: 1,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.brandPurple,
        ),
        cursorColor: AppColors.brandPurple,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        buildCounter: (
          context, {
          required currentLength,
          required isFocused,
          maxLength,
        }) =>
            null,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.authFieldFill,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          counterText: '',
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kOtpBoxRadius),
            borderSide: BorderSide.none,
          ),
          enabledBorder: outlineBorder,
          focusedBorder: outlineBorder,
        ),
        onChanged: (v) => widget.controller.onDigitChanged(widget.index, v),
      ),
    );
  }
}
