import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:micro_core/micro_core.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget with BaseApp {
  MyApp({super.key}) {
    super.registerInjections();
    super.registerRouters();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Micro Frontends',
      navigatorKey: navigatorKey,
      onGenerateRoute: super.generateRoute,
      initialRoute: '/home',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
    MicroAppHomeResolver(),
  ];
}
