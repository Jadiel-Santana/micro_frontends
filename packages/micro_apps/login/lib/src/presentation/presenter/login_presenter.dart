import 'package:flutter/material.dart';

import 'package:micro_core/micro_core.dart';
import 'package:validation/validation.dart';

import '../../../login.dart';

class LoginPresenter extends ValueNotifier<LoginState> {
  final AppNavigator appNavigator;

  LoginPresenter({
    required this.appNavigator,
  }) : super(LoginState.initial(isFormValid: false));

  final emailController = CustomTextEditingController(
    validator: ValidatorBuilder().required().email().build(),
  );
  final passwordController = CustomTextEditingController(
    validator: ValidatorBuilder().required().build(),
  );

  Future<void> login() async {
    value = LoginState.loading();

    await Future.delayed(const Duration(seconds: 2));

    appNavigator.pushReplacement(AppRoutes.homePage);
  }

  void onFormChanged() {
    if (_isFormValid) {
      value = LoginState.initial(isFormValid: true);
    } else {
      value = LoginState.initial(isFormValid: false);
    }
  }

  bool get _isFormValid => emailController.isValid && passwordController.isValid;
}
