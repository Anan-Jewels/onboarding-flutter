import 'dart:async';
import 'dart:developer';
import 'package:anan_onboarding/injection.dart';
import 'package:anan_onboarding/routes/route_list.dart';
import 'package:anan_onboarding/store/app_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/auth/static_splashscreen.dart';
import 'services/services.dart';

class AppInit extends StatefulWidget {
  final String? onNext;

  const AppInit({Key? key, this.onNext}) : super(key: key);

  @override
  State<AppInit> createState() => _AppInitState();
}

class _AppInitState extends State<AppInit> {
  bool? hidePopUp;

  @override
  void initState() {
    super.initState();
    hidePopUp = false;
    loadInitData();
  }

  void hideNotification(bool value) {
    setState(() {
      hidePopUp = value;
    });
  }

  Future loadInitData() async {
    try {
      /// Load App model config
      Services().setAppServices();
      await Future.delayed(
        Duration.zero,
        () async {
          context.read<AppStore>().init();
        },
      );
    } catch (e, trace) {
      log(e.toString());
      log(trace.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return StaticSplashScreen(
      duration: 3000,
      imagePath: 'assets/png/splash_logo.png',
      onNextScreen: onNextScreen(),
    );
  }

  String onNextScreen() {
    return RouteList.splash;
  }
}
