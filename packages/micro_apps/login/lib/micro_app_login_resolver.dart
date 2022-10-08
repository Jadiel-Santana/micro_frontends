import 'package:micro_core/micro_core.dart';
import 'src/src.dart';

class MicroAppLoginResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_login';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/login': (_, __) => const LoginPage(),
      };

  @override
  void Function() get injectionsRegister => () {};
}
