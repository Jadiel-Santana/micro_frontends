import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:design_system/design_system.dart';
import 'package:micro_core/micro_core.dart';

class App extends StatelessWidget {
  App({
    super.key,
  });

  final _navigatorKey = InjectionContainer.instance<GlobalKey<NavigatorState>>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp],
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
    );

    return MaterialApp(
      title: 'Micro Frontends',
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      theme: AppTheme.defaultThemeData,
      initialRoute: AppRoutes.splashPage,
      onGenerateRoute: (settings) {
        final route = AppRoutes.findRoute(name: settings.name ?? '');

        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (context) => route.child(
            AppRouteArguments(settings.arguments),
          ),
        );
      },
    );
  }
}
