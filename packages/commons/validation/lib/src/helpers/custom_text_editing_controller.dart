import 'package:flutter/material.dart';

class CustomTextEditingController extends TextEditingController {
  final FormFieldValidator<String>? _validator;

  final ValueNotifier<String?> errorText = ValueNotifier(null);
  final ValueNotifier<bool> isValid = ValueNotifier(false);
  bool userInteraction = false;

  CustomTextEditingController({
    String? text,
    FormFieldValidator<String>? validator,
  })  : _validator = validator,
        super(text: text);

  void validate(String? value) {
    final result = _validator?.call(value);

    errorText.value = result;

    isValid.value = result == null && text.isNotEmpty;
  }

  @override
  void dispose() {
    errorText.dispose();
    isValid.dispose();
    super.dispose();
  }
}
