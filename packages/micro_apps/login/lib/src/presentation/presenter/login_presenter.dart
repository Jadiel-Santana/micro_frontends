import 'package:micro_core/micro_core.dart';
import 'package:validation/validation.dart';

import 'login_state.dart';

class LoginPresenter extends FormNotifier<LoginState> {
  final AppNavigator appNavigator;

  LoginPresenter({
    required this.appNavigator,
  }) : super(LoginState.initial(isFormValid: false));

  final emailController = CustomTextEditingController(
    validator: ValidatorBuilder().required().email().build(),
  );

  final passwordController = CustomTextEditingController(
    validator: ValidatorBuilder().required().minLength(4).build(),
  );

  Future<void> login() async {
    value = LoginState.loading();

    await Future.delayed(const Duration(seconds: 2));

    appNavigator.pushReplacement(AppRoutes.homePage);
  }

  @override
  void onFormChanged() {
    value = LoginState.initial(isFormValid: isFormValid && hasUserInteraction);
  }

  @override
  List<CustomTextEditingController> get fieldControllers => [
        emailController,
        passwordController,
      ];
}
