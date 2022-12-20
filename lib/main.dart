import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:design_system/design_system.dart';
import 'package:micro_core/micro_core.dart';

import 'package:splash/splash.dart';
import 'package:login/login.dart';
import 'package:home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget with BaseApp {
  MyApp({super.key}) {
    super.registerInjections();
    super.registerRouters();
  }

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
      theme: AppTheme.defaultThemeData,
      navigatorKey: navigatorKey,
      onGenerateRoute: super.generateRoute,
      initialRoute: '/splash',
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
        MicroAppSplashResolver(),
        MicroAppLoginResolver(),
        MicroAppHomeResolver(),
      ];
}
