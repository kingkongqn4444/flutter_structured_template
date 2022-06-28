import 'package:flutter_modular/flutter_modular.dart';

import '../config/route_constants.dart';
import '../views/auth/login.dart';
import '../views/home/home.dart';
import '../views/splash/splash.dart';
import '../views/widgets/no_internet.dart';
import '../views/widgets/router_error.dart';

class CustomRouter {
  static List<ModularRoute> getRoutes() {
    return [
      ChildRoute(Routes.splash, child: (context, args) => const SplashPage()),
      ChildRoute(Routes.login, child: (context, args) => const LoginPage()),
      ChildRoute(Routes.home,
          child: (context, args) => HomePage(title: args.data)),
      ChildRoute(Routes.noInternet,
          child: (context, args) => const NoInternetPage()),
      WildcardRoute(
          child: (context, args) =>
              const RouterErrorPage(message: 'Page not found.')),
    ];
  }
}
