import 'package:flutter/material.dart';

import 'package:dependencies/dependencies.dart';
import 'package:micro_core/micro_core.dart';

import 'package:home/home.dart';
import 'package:login/login.dart';
import 'package:splash/splash.dart';

class AppModule extends MainModule {
  @override
  List<BaseModule> get modules => [
        SplashModule(),
        LoginModule(),
        HomeModule(),
      ];

  @override
  Future<void> registerGlobalInjections() async {
    instance.registerLazySingleton<GlobalKey<NavigatorState>>(
      () => GlobalKey<NavigatorState>(),
    );
    instance.registerLazySingleton<AppNavigator>(
      () => AppNavigatorImpl(navigatorKey: instance()),
    );
    instance.registerLazySingleton<Dio>(
      () => Dio(),
    );
  }

  @override
  List<AppRoute> get routes => [];
}
