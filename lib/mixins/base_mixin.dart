import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

mixin BaseClass {
  // returns the width of the screen
  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  //returns the height of the screen
  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // open next screen written in destination and keeps the previous screen in stack
  void pushToNextScreen(
      {required BuildContext context, required Widget destination}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  void popToPreviousScreen({required BuildContext context}) {
    Navigator.pop(context);
  }

  void popToPreviousAndReturnData({required BuildContext context}) {
    Navigator.pop(context, true);
  }

  //replaces the current screen with the destination and clears previous stack
  void pushAndReplace(
      {required BuildContext context, required Widget destination}) {
    //Navigator.of(context).pop();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => destination));
  }

  void pushToNextScreenLikeIOS(
      {required BuildContext context, required Widget destination}) {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => destination));
  }

  void pushToNextScreenWithAnimation(
      {required BuildContext context, required Widget destination}) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => destination,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: child,
        ),
        /*transitionDuration: Duration(milliseconds: 2000),*/
      ),
    );
  }

  void pushToNextScreenWithFadeAnimation(
      {required BuildContext context,
      required Widget destination,
      int duration = 500}) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => destination,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: Duration(milliseconds: duration),
      ),
    );
  }

  void pushReplaceAndClearStack(
      {required BuildContext context, required Widget destination}) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => destination),
        (Route<dynamic> route) => false);
  }

  String getDeviceType() {
    if (Platform.isAndroid) {
      return "android";
    } else {
      return "ios";
    }
  }

  void showError({
    required String title,
    required String message,
  }) {
    Get.snackbar(title, message,
        colorText: Colors.black,
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 1500));
  }

  void showSuccess({
    required String title,
    required String message,
  }) {
    Get.snackbar(title, message,
        colorText: Colors.black,
        backgroundColor: Colors.green,
        duration: const Duration(milliseconds: 1500));
  }

  Future<bool> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (kDebugMode) {
          print('connected');
        }
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      if (kDebugMode) {
        print('not connected');
      }
      //Here you can setState a bool like internetAvailable = false;
      //or use call this before uploading data to firestore/storage depending upon the result, you can move on further.
      return false;
    }
  }
}
