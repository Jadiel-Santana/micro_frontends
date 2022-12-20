import '../../micro_core.dart';

abstract class MainModule extends BaseModule {
  List<BaseModule> get modules;

  Future<void> registerGlobalInjections();

  @override
  Future<void> init() async {
    await registerGlobalInjections();

    for (var module in modules) {
      await module.init();
    }

    _registerRoutes();
  }

  void _registerRoutes() => modules.map((module) => module.routes).forEach(AppRoutes.addRoutes);
}
