import 'package:anan_onboarding/models/arguments_model.dart';
import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, [ScreenArguments? arguments]) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateReplacementTo(String routeName,
      [ScreenArguments? arguments]) async {
    return await navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> popAndReplace(String routeName,
      [ScreenArguments? arguments]) async {
    return await navigatorKey.currentState!
        .popAndPushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> popEndPush(String routeName,
      [ScreenArguments? arguments]) async {
    return await navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (route) => route.isFirst,
        arguments: arguments);
  }

  Future<dynamic> showLoadingDialog({required Widget child}) async {
    return await showDialog(
        context: navigatorKey.currentContext!, builder: (context) => child);
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }
}
