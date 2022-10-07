import 'package:micro_core/micro_core.dart';
import 'src/src.dart';

class MicroAppHomeResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_home';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    '/home': (context, args) => const HomePage(),
  };

  @override
  void Function() get injectionsRegister => (){};
}
