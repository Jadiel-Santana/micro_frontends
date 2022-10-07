import 'package:flutter/material.dart';

import 'src.dart';

abstract class BaseApp {
  List<MicroApp> get microApps;

  Map<String, WidgetBuilderArgs> get baseRoutes;

  final Map<String, WidgetBuilderArgs> routes = {};

  void registerRouters() {
    if (baseRoutes.isNotEmpty) {
      routes.addAll(baseRoutes);
    }
    if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        routes.addAll(microApp.routes);
      }
    }
  }

  void registerInjections() {
    if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        microApp.injectionsRegister();
      }
    }
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    final routerName = settings.name;
    final routerArgs = settings.arguments;

    final navigateTo = routes[routerName];
    if (navigateTo == null) {
      return null;
    }
    return MaterialPageRoute(
      builder: (context) => navigateTo.call (context, routerArgs),
    );
  }
}
