import 'package:micro_core/micro_core.dart';

import 'data/usecases/usecases.dart';
import 'domain/usecases/usecases.dart';
import '../home.dart';

class HomeModule extends BaseModule {
  @override
  Future<void> init() async {
    instance.registerLazySingleton<FetchProductsUsecase>(
      () => RemoteFetchProducts(
        dio: instance(),
      ),
    );
    instance.registerLazySingleton<HomePresenter>(
      () => HomePresenter(
        fetchProductsUsecase: instance(),
        appNavigator: instance(),
      ),
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
