import 'package:flutter_modular/flutter_modular.dart';
import '../app.dart';

import '../module/app_module.dart';

class ModularHelper {
  static initializeModularComponent() async {
    // Modular.setInitialRoute(Routes.login);
    Modular.setNavigatorKey(navigator);
    await Modular.isModuleReady<AppModule>();
  }
}
