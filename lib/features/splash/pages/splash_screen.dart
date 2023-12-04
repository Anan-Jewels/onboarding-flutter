import 'dart:async';

import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../core/core.dart';

/// Splash Screen.
class SplashScreen extends StatefulWidget {
  /// Constructor of the Splash Screen.
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  /// Start Timer...
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      timer.cancel();
      bool isLogin = VariableUtilities.preferences
              .getBool(LocalCacheKey.applicationLoginState) ??
          false;
      if (isLogin) {
        /// if user is logged in then redirect to the home screen.
        // String homeScreen = RouteConfig.dashboardScreen;
        String homeScreen = RouteConfig.home;
        Navigator.pushReplacementNamed(context, homeScreen);
      } else {
        /// if user is not logged in then redirect to the login screen.
        String screen = RouteConfig.home;
        Navigator.pushReplacementNamed(context, screen, arguments: {});
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Text(
          'Anan Jewel',
          style: FontUtilities.style(
            fontSize: 32,
            fontWeight: FWT.bold,
            fontColor: blackColor,
          ),
        ),
      ),
    );
  }
}
