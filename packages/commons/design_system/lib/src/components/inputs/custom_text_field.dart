import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:validation/validation.dart';

import '../../theme/theme.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final CustomTextEditingController controller;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? floatingLabelText;
  final bool enabled;
  final VoidCallback? onEditingComplete;
  final List<String>? autofillHints;
  final bool autoFocus;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.visiblePassword,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.initialValue,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.floatingLabelText,
    this.enabled = true,
    this.onEditingComplete,
    this.autofillHints,
    this.autoFocus = false,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.controller.text.isEmpty && widget.initialValue?.isNotEmpty == true) {
      widget.controller.text = widget.initialValue!;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.controller.validate(widget.controller.text);
      });
    }

    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<String?>(
        valueListenable: widget.controller.errorText,
        builder: (_, errorText, __) => TextFormField(
          controller: widget.controller,
          autofillHints: widget.autofillHints,
          onEditingComplete: () {
            widget.onEditingComplete?.call();
          },
          autofocus: widget.autoFocus,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) => _focusNode.nextFocus(),
          onChanged: (text) {
            widget.controller.errorText.value = null;
            widget.controller.validate(text);
            widget.controller.userInteraction = true;
            widget.onChanged?.call(text);
          },
          enabled: widget.enabled,
          keyboardType: widget.keyboardType,
          focusNode: _focusNode,
          textCapitalization: widget.textCapitalization,
          inputFormatters: widget.inputFormatters,
          maxLength: widget.maxLength,
          obscureText: widget.obscureText,
          autocorrect: false,
          enableSuggestions: false,
          cursorColor: AppColors.black,
          style: AppTextTheme.paragraph1.copyWith(
            color: widget.enabled ? AppColors.black : AppColors.secondary,
          ),
          decoration: InputDecoration(
            counterText: '',
            contentPadding: const EdgeInsets.only(top: 16, bottom: 18, left: 16, right: 12),
            alignLabelWithHint: true,
            border: InputBorder.none,
            enabledBorder: colorBorder(errorText),
            focusedBorder: colorBorder(errorText),
            disabledBorder: colorBorder(errorText),
            errorBorder: colorBorder(errorText),
            focusedErrorBorder: colorBorder(errorText),
            labelStyle: AppTextTheme.paragraph1.copyWith(
              color: widget.enabled ? AppColors.primary : AppColors.secondary,
            ),
            floatingLabelStyle: AppTextTheme.subtitle1.copyWith(
              color: AppColors.black,
            ),
            errorText: errorText,
            labelText: _focusNode.hasFocus || widget.controller.text.isNotEmpty
                ? widget.floatingLabelText ?? widget.label
                : widget.label,
            prefixIcon: widget.prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 16, right: 8),
                    child: widget.prefixIcon,
                  )
                : null,
            prefixIconConstraints: const BoxConstraints(
              minHeight: 24,
              minWidth: 24,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: widget.suffixIcon,
            ),
            suffixIconConstraints: const BoxConstraints(
              minHeight: 24,
              minWidth: 24,
            ),
          ),
          obscuringCharacter: '*',
        ),
      );

  Color _changeBorderColor(String? errorText) {
    if (!widget.enabled) {
      return AppColors.secondary;
    } else if (errorText == null && widget.controller.text.isEmpty) {
      return AppColors.black;
    } else if (errorText != null) {
      return AppColors.red;
    } else {
      return AppColors.primary;
    }
  }

  OutlineInputBorder colorBorder(String? errorText) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: _changeBorderColor(errorText),
        ),
      );
}
