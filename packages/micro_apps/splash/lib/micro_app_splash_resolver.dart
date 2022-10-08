import 'package:micro_core/micro_core.dart';
import 'src/src.dart';

class MicroAppSplashResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_splash';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/splash': (_, __) => SplashPage(controller: SplashController()),
      };

  @override
  void Function() get injectionsRegister => () {};
}
