import 'package:micro_core/micro_core.dart';

import '../splash.dart';

class SplashModule extends BaseModule {
  @override
  Future<void> init() async {
    instance.registerFactory<SplashPresenter>(
      () => SplashPresenter(appNavigator: instance()),
    );
  }

  @override
  List<AppRoute> get routes => [
        AppRoute(
          name: AppRoutes.splashPage,
          child: (_) => SplashPage(
            presenter: instance(),
          ),
        )
      ];
}
