import 'package:anan_onboarding/app_init.dart';
import 'package:anan_onboarding/anan.dart';
import 'package:anan_onboarding/presentation/screens/app_base.dart';
import 'package:anan_onboarding/routes/route_list.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() => _routes;

  static Route getRouteGenerate(RouteSettings settings) =>
      _routeGenerate(settings);

  static final Map<String, WidgetBuilder> _routes = {
    RouteList.home: (context) => const AppBase(),
    RouteList.splash: (context) => const SafeArea(
          child: ScrollConfiguration(
            behavior: ScrollBehaviorModified(),
            child: Scaffold(
              body: AppInit(
                onNext: RouteList.home,
              ),
            ),
          ),
        ),
  };

  static Route _routeGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RouteList.home:
        return _buildRouteFade(settings, const AppBase());
      default:
        return _errorRoute();
    }
  }

  static WidgetBuilder getWidgetRouteByName(String name) {
    if (_routes.containsKey(name) == false) {
      return _routes[RouteList.home]!;
    }
    return _routes[name]!;
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('Page not found'),
          ),
        );
      },
    );
  }

  static PageRouteBuilder _buildRouteFade(
      RouteSettings settings, Widget builder) {
    return _FadedTransitionRoute(
      settings,
      widget: builder,
    );
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget? widget;
  final RouteSettings settings;

  _FadedTransitionRoute(
    this.settings, {
    this.widget,
  }) : super(
          settings: settings,
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget!;
          },
          transitionDuration: const Duration(milliseconds: 100),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              ),
              child: child,
            );
          },
        );
}
