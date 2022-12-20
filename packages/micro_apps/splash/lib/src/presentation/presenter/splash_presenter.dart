import 'package:micro_core/micro_core.dart';

class SplashPresenter {
  final AppNavigator appNavigator;

  SplashPresenter({
    required this.appNavigator,
  });

  Future<void> goToLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    appNavigator.pushReplacement(AppRoutes.loginPage);
  }
}
