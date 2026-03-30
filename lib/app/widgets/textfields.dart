import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sabi_vendor_hub_mobile/app/constants/enviroment.dart';
import 'package:sabi_vendor_hub_mobile/app/utils/app_logger.dart';
import 'package:sabi_vendor_hub_mobile/app/widgets/space.dart';


class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.obscureText = false,
    this.controller,
    this.hint,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.contentPadding,
    this.onFieldSubmitted,
    this.textInputAction,
    this.autoFocus,
    this.autofillHints,
    this.readOnly,
    this.onTap,
    this.isRequired,
  });

  final bool obscureText;
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final bool? autoFocus;
  final bool? readOnly;

  final Function(String)? onFieldSubmitted;
  final Iterable<String>? autofillHints;
  final void Function()? onTap;
  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: RichText(
            text: TextSpan(
              text: label ?? "",
              style: GoogleFonts.instrumentSans(
                color: Get.theme.colorScheme.onSurface,
                fontSize: 13.sp,
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              children: [
                TextSpan(
                  text: isRequired == true ? " *" : "",
                  style: GoogleFonts.instrumentSans(
                    color: Get.theme.colorScheme.error,
                    fontSize: 13.sp,
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              ],
            ),
          ),
        ),
        vSpace(5),
        TextFormField(
          onTap: onTap,
          focusNode: FocusNode(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscureText,
          controller: controller,
          keyboardType: keyboardType,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          readOnly: readOnly ?? false,
          textInputAction: textInputAction,
          autofillHints: autofillHints,
          decoration: InputDecoration(
            filled: true,
            focusColor: Get.theme.colorScheme.primary,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Get.theme.colorScheme.surfaceContainerHighest,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Get.theme.colorScheme.onSurfaceVariant,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Get.theme.colorScheme.surfaceContainerHighest,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            suffixIconColor: Get.theme.colorScheme.surfaceContainerHighest,
            prefixIconColor: Get.theme.colorScheme.surfaceContainerHighest,
            hintText: hint,
            hintStyle: GoogleFonts.instrumentSans(
              color: Get.theme.colorScheme.onSurfaceVariant.withOpacity(0.5),
            ),
            suffixIconConstraints:
                BoxConstraints(maxWidth: 40.w, maxHeight: 40.h),
            contentPadding: contentPadding,
            labelStyle: TextStyle(
              color: Get.theme.colorScheme.onSurface,
            ), // Customize label text color
          ),
          autofocus: autoFocus ?? false,
          style: GoogleFonts.instrumentSans(
            color: Get.theme.colorScheme.onSurface,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ), // Customize text color
          cursorColor: Get.theme.colorScheme.onSurface,
          validator: validator,
        ),
      ],
    );
  }
}

class DropdownTextFormField extends StatelessWidget {
  const DropdownTextFormField({
    required this.hint,
    required this.value,
    this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset = Offset.zero,
    this.validator,
    this.focusNode,
    this.onFieldSubmitted,
    this.label,
    this.items,
    this.isRequired,
    super.key,
  });

  final String hint;
  final String? value;
  final String? label;
  final List<String>? dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;
  final List<DropdownMenuItem<String>>? items;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: RichText(
            text: TextSpan(
              text: label ?? "",
              style: GoogleFonts.instrumentSans(
                color: Get.theme.colorScheme.onSurface,
                fontSize: 12.sp,
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              children: [
                TextSpan(
                  text: isRequired == true ? " *" : "",
                  style: GoogleFonts.instrumentSans(
                    color: Get.theme.colorScheme.error,
                    fontSize: 12.sp,
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              ],
            ),
          ),
        ),
        vSpace(5),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField2<String>(
            value: value,
            isExpanded: true,
            focusNode: focusNode,
            hint: Text(hint,
                style: GoogleFonts.instrumentSans(
                  color:
                      Get.theme.colorScheme.onSurfaceVariant.withOpacity(0.5),
                  fontSize: 12.sp,
                )),
            items: items,
            onChanged: onChanged,
            selectedItemBuilder: selectedItemBuilder,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: BorderSide(
                    color: Get.theme.colorScheme.surfaceContainerHighest, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide:
                    BorderSide(color: Get.theme.colorScheme.primary, width: 2),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
            ),
            validator: validator ??
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select at least one option';
                  }
                  return null;
                },
            dropdownStyleData: DropdownStyleData(
              maxHeight: (dropdownHeight ?? 200).h,
              width: (dropdownWidth ?? 350).w,
              padding: dropdownPadding ?? const EdgeInsets.all(8),
              decoration: dropdownDecoration ??
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    color: Get.theme.colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8.r,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
              elevation: dropdownElevation ?? 8,
              offset: offset,
            ),
            iconStyleData: IconStyleData(
              icon: icon ??
                  Icon(
                    IconsaxPlusLinear.arrow_down,
                    size: 20.sp,
                    color: Get.theme.colorScheme.onSurface,
                  ),
              iconSize: (iconSize ?? 16).sp,
              iconEnabledColor:
                  iconEnabledColor ?? Get.theme.colorScheme.onSurfaceVariant,
              iconDisabledColor:
                  iconDisabledColor ?? Get.theme.colorScheme.onSurfaceVariant,
            ),
            menuItemStyleData: MenuItemStyleData(
              height: (itemHeight ?? 40).h,
              padding: itemPadding ?? EdgeInsets.only(left: 14.w, right: 14.w),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryTextFormField extends StatefulWidget {
  const CategoryTextFormField({
    required this.hint,
    this.value,
    this.validator,
    this.focusNode,
    this.label,
    this.items,
    this.options,
    this.suffixIcon,
    required this.onSearch,
    this.isRequired,
    required this.onSelected,
    this.readOnly,
    super.key,
  });

  final String hint;
  final String? value;
  final String? label;
  final List<String>? options;
  final List<DropdownMenuItem<String>>? items;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Function(String) onSelected;
  // Fixed: Changed type to be a function that returns List<String>
  final List<String> Function(String) onSearch;
  final bool? isRequired;
  final bool? readOnly;

  @override
  State<CategoryTextFormField> createState() => _CategoryTextFormFieldState();
}

class _CategoryTextFormFieldState extends State<CategoryTextFormField> {
  late TextEditingController _controller;
  List<String> filteredOptions = [];
  bool showDropdown = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    filteredOptions = widget.options ?? [];
  }

  @override
  void didUpdateWidget(CategoryTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _controller.text = widget.value ?? '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          RichText(
            text: TextSpan(
              text: widget.label,
              style: GoogleFonts.instrumentSans(
                color: Get.theme.colorScheme.onSurface,
                fontSize: 12.sp,
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              children: [
                if (widget.isRequired == true)
                  TextSpan(
                    text: " *",
                    style: GoogleFonts.instrumentSans(
                      color: Get.theme.colorScheme.error,
                      fontSize: 12.sp,
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
              ],
            ),
          ),
          vSpace(5),
        ],
        AppTextFormField(
          controller: _controller,
          hint: widget.hint,
          readOnly: widget.readOnly,
          onChanged: (value) {
            setState(() {
              // Now correctly calling the function
              filteredOptions = widget.onSearch(value);
              showDropdown = true;
            });
          },
          onTap: () {
            setState(() {
              filteredOptions = widget.options ?? [];
              showDropdown = true;
            });
          },
        ),
        if (showDropdown && filteredOptions.isNotEmpty)
          Container(
            constraints: const BoxConstraints(maxHeight: 200),
            child: Material(
              elevation: 4,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: filteredOptions.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final option = filteredOptions[index];
                  return ListTile(
                    tileColor: Get.theme.colorScheme.surface,
                    title: Text(
                      option,
                      style: GoogleFonts.instrumentSans(
                        color: Get.theme.colorScheme.onSurface,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _controller.text = option;
                        showDropdown = false;
                      });
                      appLog("Selected option: $option");
                      widget.onSelected(option);
                    },
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}

class AppMultiTextFormField extends StatelessWidget {
  const AppMultiTextFormField({
    super.key,
    this.controller,
    this.hint,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.text,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.contentPadding,
    this.minLines,
    this.maxLines,
    this.onFieldSubmitted,
    this.textInputAction,
    this.autoFocus,
    this.isRequired,
  });

  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? text;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final bool? autoFocus;
  final bool? isRequired;

  final int? minLines;
  final int? maxLines;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null || text != null,
          child: text ??
              RichText(
                text: TextSpan(
                  text: label ?? "",
                  style: GoogleFonts.instrumentSans(
                    color: Get.theme.colorScheme.onSurface,
                    fontSize: 13.sp,
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  children: [
                    TextSpan(
                      text: isRequired == true ? " *" : "",
                      style: GoogleFonts.instrumentSans(
                        color: Get.theme.colorScheme.error,
                        fontSize: 12.sp,
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  ],
                ),
              ),
        ),
        vSpace(10),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autofocus: autoFocus ?? false,
          controller: controller,
          keyboardType: keyboardType,
          onFieldSubmitted: onFieldSubmitted,
          minLines: minLines,
          maxLines: maxLines,
          onChanged: onChanged,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            focusColor: Get.theme.colorScheme.onSurface,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Get.theme.colorScheme.surfaceContainerHighest,
                width: 2,
              ), // Grey border
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Get.theme.colorScheme.onSurfaceVariant,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Get.theme.colorScheme.surfaceContainerHighest),
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            suffixIconColor: Get.theme.colorScheme.surfaceContainerHighest,
            prefixIconColor: Get.theme.colorScheme.surfaceContainerHighest,
            hintText: hint,
            hintMaxLines: 1,
            hintStyle: GoogleFonts.instrumentSans(
              color: Get.theme.colorScheme.onSurfaceVariant.withOpacity(0.5),
            ),
            contentPadding: contentPadding,
            labelStyle: GoogleFonts.instrumentSans(
              color: Get.theme.colorScheme.onSurface,
            ),
          ),
          style: GoogleFonts.instrumentSans(
            color: Get.theme.colorScheme.onSurface,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ), // Customize text color
          cursorColor: Get.theme.colorScheme.primary, // Customize cursor color
          validator:
              validator, // Use the provided validator function, or it will be null by default
        ),
      ],
    );
  }
}

class GooglePlacesTextFormField extends StatelessWidget {
  GooglePlacesTextFormField({
    super.key,
    this.obscureText,
    required this.controller,
    this.hint,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
    this.hasBgColor,
    this.getPlaceDetailWithLatLng,
    this.onChanged,
    this.textInputAction,
    this.isRequired,
    this.readOnly,
  });

  final bool? obscureText;
  final TextEditingController controller;
  final String? hint;
  final String? label;
  bool? hasBgColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  void Function(Prediction)? getPlaceDetailWithLatLng;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final bool? isRequired;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: RichText(
            text: TextSpan(
              text: label ?? "",
              style: GoogleFonts.instrumentSans(
                color: Get.theme.colorScheme.onSurface,
                fontSize: 13.sp,
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              children: [
                TextSpan(
                  text: isRequired == true ? " *" : "",
                  style: GoogleFonts.instrumentSans(
                    color: Get.theme.colorScheme.error,
                    fontSize: 13.sp,
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              ],
            ),
          ),
        ),
        vSpace(5),
        Container(
          decoration: BoxDecoration(
            color: hasBgColor == true ? Get.theme.colorScheme.surface : null,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: GooglePlacesAutoCompleteTextFormField(
            textInputAction: textInputAction ?? TextInputAction.done,
            scrollPhysics: const BouncingScrollPhysics(),
            textEditingController: controller,
            googleAPIKey: AppEnvironment.GOOGLE_MAPS_API_KEY,
            onChanged: onChanged,
            debounceTime: 400, // defaults to 600 ms,
            readOnly: readOnly ?? false,
            countries: const [
              "cy"
            ], // optional, by default the list is empty (no restrictions)
            /* isLatLngRequired:
                true, // if you require the coordinates from the place details
            getPlaceDetailWithLatLng:
                getPlaceDetailWithLatLng, // this callback is called when isLatLngRequired is true
            itmClick: (prediction) {
              if (prediction.description != null) {
                controller.text = prediction.description!;
                controller.selection = TextSelection.fromPosition(
                  TextPosition(
                    offset: prediction.description!.length,
                  ),
                );
              }
            }, */
            autocorrect: false,
            decoration: InputDecoration(
              focusColor: Get.theme.colorScheme.onSurfaceVariant,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Get.theme.colorScheme.onSurfaceVariant,
                  width: 2,
                ), // Grey border
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: simPad(16, 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Get.theme.colorScheme.surfaceContainerHighest,
                  width: 2,
                ), // Grey border
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Get.theme.colorScheme.surfaceContainerHighest,
                  width: 2,
                ), // Grey border
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              isDense: true,
              hintText: hint,
              hintStyle: GoogleFonts.instrumentSans(
                color: Get.theme.colorScheme.onSurfaceVariant.withOpacity(0.5),
              ),
              labelStyle: GoogleFonts.instrumentSans(
                color: Get.theme.colorScheme.onSurface,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ), // Custze label text color
            ),
            style: GoogleFonts.instrumentSans(
              color: Get.theme.colorScheme.onSurface,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              textStyle: Theme.of(context).textTheme.bodyMedium,
            ), // Customize tustomize text color
            autovalidateMode: AutovalidateMode.disabled,
            cursorColor:
                Get.theme.colorScheme.onSurface, // Customize cursor color
            validator:
                validator, // Use the provided validator function, or it will be null by default
          ),
        ),
      ],
    );
  }
}

class PhoneNumberTextFormField extends StatelessWidget {
  const PhoneNumberTextFormField(
      {super.key,
      this.obscureText = false,
      this.controller,
      this.hint,
      this.label,
      this.prefixIcon,
      this.suffixIcon,
      this.keyboardType,
      this.validator,
      this.onChanged,
      this.contentPadding,
      this.onFieldSubmitted,
      this.textInputAction,
      this.autoFocus,
      this.autofillHints,
      this.readOnly,
      this.onTap,
      this.isRequired,
      this.initialValue,
      this.onInputChanged});

  final bool obscureText;
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final Widget? prefixIcon;
  final PhoneNumber? initialValue;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final Function(PhoneNumber)? onInputChanged;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final bool? autoFocus;
  final bool? readOnly;

  final Function(String)? onFieldSubmitted;
  final Iterable<String>? autofillHints;
  final void Function()? onTap;
  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: RichText(
            text: TextSpan(
              text: label ?? "",
              style: GoogleFonts.instrumentSans(
                color: Get.theme.colorScheme.onSurface,
                fontSize: 13.sp,
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              children: [
                TextSpan(
                  text: isRequired == true ? " *" : "",
                  style: GoogleFonts.instrumentSans(
                    color: Get.theme.colorScheme.error,
                    fontSize: 13.sp,
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              ],
            ),
          ),
        ),
        vSpace(5),
        InternationalPhoneNumberInput(
          initialValue: initialValue,
          formatInput: false,
          onFieldSubmitted: onFieldSubmitted,
          keyboardAction: textInputAction,
          textFieldController: controller,
          autofillHints: autofillHints,
          selectorConfig: SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            useBottomSheetSafeArea: true,
          ),
          onInputChanged: onInputChanged,
          onSubmit: onTap,
          hintText: hint,
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.always,
          focusNode: FocusNode(),
          inputDecoration: InputDecoration(
            filled: true,
            focusColor: Get.theme.colorScheme.primary,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Get.theme.colorScheme.surfaceContainerHighest,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Get.theme.colorScheme.onSurfaceVariant,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Get.theme.colorScheme.surfaceContainerHighest,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            suffixIconColor: Get.theme.colorScheme.surfaceContainerHighest,
            prefixIconColor: Get.theme.colorScheme.surfaceContainerHighest,
            hintText: hint,
            hintStyle: GoogleFonts.instrumentSans(
              color: Get.theme.colorScheme.onSurfaceVariant.withOpacity(0.5),
            ),
            suffixIconConstraints:
                BoxConstraints(maxWidth: 40.w, maxHeight: 40.h),
            contentPadding: contentPadding,
            labelStyle: TextStyle(
              color: Get.theme.colorScheme.onSurface,
            ),
          ),
          textStyle: GoogleFonts.instrumentSans(
            color: Get.theme.colorScheme.onSurface,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
          cursorColor: Get.theme.colorScheme.onSurface,
          validator: validator,
        )
      ],
    );
  }
}
