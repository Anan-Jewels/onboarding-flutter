import 'package:flutter/material.dart';

import '../../features/home/pages/home_screen.dart';
import '../../features/splash/pages/splash_screen.dart';

/// Manage all the routes used in the application.
class RouteConfig {
  static const String root = '/';
  static const String home = '/home';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    String routeName = settings.name ?? RouteConfig.root;

    switch (routeName) {
      case RouteConfig.root:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );

      case RouteConfig.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );
    }
    return null;
  }
}
