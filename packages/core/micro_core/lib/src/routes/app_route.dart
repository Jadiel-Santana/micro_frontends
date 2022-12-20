import 'package:flutter/material.dart';

class AppRoute {
  AppRoute({
    required this.name,
    required this.child,
  });

  final String name;
  final Widget Function(AppRouteArguments args) child;
}

class AppRouteArguments {
  final dynamic data;

  AppRouteArguments(this.data);
}

class AppRoutes {
  AppRoutes._();

  static const splashPage = 'splash';
  static const homePage = 'home';
  static const loginPage = 'login';

  static final _routes = <AppRoute>[];
  static void addRoutes(List<AppRoute> routes) {
    _routes.addAll(routes);
  }

  static AppRoute findRoute({required String name}) => _routes.firstWhere(
        (element) => name == element.name,
        orElse: () => throw Exception(
          "The route $name isn't registered on AppRoutes.",
        ),
      );
}
