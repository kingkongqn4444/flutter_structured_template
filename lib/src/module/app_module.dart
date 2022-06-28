import 'package:flutter_modular/flutter_modular.dart';

import '../router/router.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => CustomRouter.getRoutes();
}
