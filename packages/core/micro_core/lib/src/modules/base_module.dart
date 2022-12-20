import 'dart:async';

import '../../micro_core.dart';

abstract class BaseModule {
  Future<void> init();

  List<AppRoute> get routes;

  InjectionContainer get instance => InjectionContainer.instance;
}
