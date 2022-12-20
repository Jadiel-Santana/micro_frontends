import 'package:micro_core/micro_core.dart';

import '../home.dart';

class HomeModule extends BaseModule {
  @override
  Future<void> init() async {
    instance.registerFactory<HomePresenter>(
      () => HomePresenter(appNavigator: instance()),
    );
  }

  @override
  List<AppRoute> get routes => [
        AppRoute(
          name: AppRoutes.homePage,
          child: (_) => HomePage(
            presenter: instance(),
          ),
        )
      ];
}
