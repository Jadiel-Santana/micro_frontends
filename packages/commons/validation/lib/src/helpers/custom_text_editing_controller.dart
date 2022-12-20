import 'package:flutter/cupertino.dart';

class CustomTextEditingController extends TextEditingController {
  FormFieldValidator<String>? validator;

  CustomTextEditingController({String? text, this.validator})
      : super(text: text);

  bool get isValid => validator?.call(text) == null;
}
