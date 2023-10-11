import 'dart:async';

import 'package:anan_onboarding/helper/Helper.dart';
import 'package:anan_onboarding/helper/app_constants.dart';
import 'package:anan_onboarding/injection.dart';
import 'package:anan_onboarding/services/navigation_service.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlashHelper {
  static Completer<BuildContext> _buildCompleter = Completer<BuildContext>();

  static void init(BuildContext context) {
    if (_buildCompleter.isCompleted == false) {
      _buildCompleter.complete(context);
    }
  }

  static void dispose() {
    if (_buildCompleter.isCompleted == false) {
      _buildCompleter.completeError(FlutterError('disposed'));
    }
    _buildCompleter = Completer<BuildContext>();
  }

  static Color _backgroundColor(BuildContext context) => AppConstants.black;

  static TextStyle _titleStyle(BuildContext context, [Color? color]) =>
      AppConstants.customNormal(
        color: color ?? AppConstants.black,
        size: 15.0,
        // weight: FontWeight.bold,
      );

  static TextStyle _contentStyle(BuildContext context, [Color? color]) =>
      AppConstants.customNormal(
        color: color ?? AppConstants.white,
        size: 15.0,
        // weight: FontWeight.bold,
      );

  static Future<T?> successBar<T>({
    String? title,
    @required String? message,
    Duration duration = const Duration(seconds: 3),
  }) {
    BuildContext context =
        locator<NavigationService>().navigatorKey.currentContext!;
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (_, controller) {
        return Flash(
          controller: controller,
          dismissDirections: const [
            FlashDismissDirection.endToStart,
            FlashDismissDirection.startToEnd,
            FlashDismissDirection.vertical,
          ],
          position: FlashPosition.top,
          child: FlashBar(
            title: title == null
                ? null
                : Text(title, style: _titleStyle(context, Colors.black)),
            content:
                Text(message!, style: _contentStyle(context, Colors.black)),
            icon: Icon(Icons.check_circle, color: Colors.green[300]),
            indicatorColor: Colors.green,
            controller: controller,
            position: FlashPosition.top,
          ),
        );
      },
    ).then((value) {
      Helper.setUIOverlayStyle(color: AppConstants.primaryColor);
      return value;
    });
  }

  static Future<T?> informationBar<T>({
    String? title,
    @required String? message,
    Duration duration = const Duration(seconds: 3),
  }) {
    BuildContext context =
        locator<NavigationService>().navigatorKey.currentContext!;
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (_, controller) {
        return Flash(
          controller: controller,
          dismissDirections: const [
            FlashDismissDirection.endToStart,
            FlashDismissDirection.startToEnd,
            FlashDismissDirection.vertical,
          ],
          position: FlashPosition.top,
          child: FlashBar(
            controller: controller,
            title: title == null
                ? null
                : Text(
                    title,
                    style: _titleStyle(context, Colors.black),
                  ),
            content: Text(
              message!,
              style: _contentStyle(context, Colors.black),
            ),
            icon: Icon(Icons.info_outline, color: Colors.blue[300]),
            indicatorColor: Colors.blue,
            position: FlashPosition.top,
          ),
        );
      },
    ).then((value) {
      Helper.setUIOverlayStyle(color: AppConstants.primaryColor);
      return value;
    });
  }

  static Future<T?> errorBar<T>({
    String? title,
    @required String? message,
    Duration duration = const Duration(seconds: 3),
  }) {
    BuildContext context =
        locator<NavigationService>().navigatorKey.currentContext!;
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (_, controller) {
        return Flash(
          controller: controller,
          dismissDirections: const [
            FlashDismissDirection.endToStart,
            FlashDismissDirection.startToEnd,
            FlashDismissDirection.vertical,
          ],
          position: FlashPosition.top,
          child: FlashBar(
            controller: controller,
            title: title == null
                ? null
                : Text(title, style: _titleStyle(context, Colors.black)),
            content: Text(message ?? '--',
                style: _contentStyle(context, Colors.black)),
            icon: Icon(Icons.warning, color: Colors.red[300]),
            indicatorColor: Colors.red,
            position: FlashPosition.top,
          ),
        );
      },
    ).then((value) {
      Helper.setUIOverlayStyle(color: AppConstants.primaryColor);
      return value;
    });
  }

  static Future<T?> actionBar<T>({
    String? title,
    @required String? message,
    @required Widget? primaryAction,
    @required ActionCallback? onPrimaryActionTap,
    Duration duration = const Duration(seconds: 3),
  }) {
    BuildContext context =
        locator<NavigationService>().navigatorKey.currentContext!;
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (_, controller) {
        return Flash(
          controller: controller,
          dismissDirections: const [
            FlashDismissDirection.endToStart,
            FlashDismissDirection.startToEnd,
            FlashDismissDirection.vertical,
          ],
          position: FlashPosition.top,
          child: FlashBar(
            controller: controller,
            title: title == null
                ? null
                : Text(
                    title,
                    style: _titleStyle(context, Colors.black),
                  ),
            content: Text(
              message!,
              style: _contentStyle(context, Colors.black),
            ),
            position: FlashPosition.top,
            primaryAction: OutlinedButton(
              onPressed: onPrimaryActionTap == null
                  ? null
                  : () => onPrimaryActionTap(controller),
              child: primaryAction!,
            ),
          ),
        );
      },
    ).then((value) {
      Helper.setUIOverlayStyle(color: AppConstants.primaryColor);
      return value;
    });
  }
}

typedef ActionCallback = void Function(FlashController controller);
