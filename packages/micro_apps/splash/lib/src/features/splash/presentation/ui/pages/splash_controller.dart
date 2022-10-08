import 'package:micro_core/micro_core.dart';

class SplashController {
  Future<void> goToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    navigatorKey.currentState?.pushReplacementNamed('/login');
  }
}
