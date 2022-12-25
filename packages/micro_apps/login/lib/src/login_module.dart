import 'package:micro_core/micro_core.dart';

import '../login.dart';

class LoginModule extends BaseModule {
  @override
  Future<void> init() async {
    instance.registerLazySingleton<LoginPresenter>(
      () => LoginPresenter(appNavigator: instance()),
    );
  }

  @override
  List<AppRoute> get routes => [
        AppRoute(
          name: AppRoutes.loginPage,
          child: (_) => LoginPage(
            presenter: instance(),
          ),
        )
      ];
}
