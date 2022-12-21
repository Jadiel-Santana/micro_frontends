import 'package:flutter/material.dart';

import '../../validation.dart';

abstract class FormNotifier<T> extends ValueNotifier<T> {
  FormNotifier(super.value) {
    _initFormListener();
  }

  List<CustomTextEditingController> get fieldControllers;

  void onFormChanged();

  void _initFormListener() {
    _listenable.addListener(onFormChanged);
  }

  Listenable get _listenable => Listenable.merge(
        fieldControllers.map((controller) => controller.isValid).toList(),
      );

  bool get isFormValid => fieldControllers.fold(
        true,
        (previousValue, controller) => previousValue && controller.isValid.value,
      );

  bool get hasUserInteraction => fieldControllers.fold(
        false,
        (previousValue, controller) => previousValue || controller.userInteraction,
      );

  @override
  void dispose() {
    super.dispose();
    for (final controller in fieldControllers) {
      controller.dispose();
    }
    _listenable.removeListener(onFormChanged);
  }
}
