import 'package:anan_onboarding/injection.dart';
import 'package:anan_onboarding/anan.dart';
import 'package:anan_onboarding/helper/Helper.dart';
import 'package:anan_onboarding/helper/app_constants.dart';
import 'package:anan_onboarding/services/navigation_service.dart';
import 'package:anan_onboarding/services/network_util.dart';
import 'package:anan_onboarding/store/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.dev);
  Provider.debugCheckInvalidValueType = null;
  _updateSystemStyle();
  await setupLocator();
  runApp(const Anan());
}

Future<void> _updateSystemStyle() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Helper.setUIOverlayStyle(color: AppConstants.white, dark: true);
}

@InjectableInit()
Future<void> setupLocator() async {
  locator.registerLazySingleton<NetworkUtil>(() => NetworkUtil());
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerFactory<AppStore>(() => AppStore());
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension ContextExtentions on BuildContext {
  double getHeight() => MediaQuery.of(this).size.height;
  double getWidth() => MediaQuery.of(this).size.width;
  MediaQueryData getQuery() => MediaQuery.of(this);

  Color white() => AppConstants.white;
  Color black() => AppConstants.black;
  Color borderColor() => const Color(0xffE0E2E1);
  // Color borderColor() => const Color(0xffA7A6A6).withOpacity(0.35);
  Color onBoarding2Color() => const Color(0xffEFE9E5);
  Color onBoarding3Color() => const Color(0xffDFE8EC);
  Color textColor() => AppConstants.textColor;
  Color primaryColor() => AppConstants.primaryColor;
  Color blueSkyColor() => AppConstants.blueSky;
  Color sageColor() => AppConstants.sageColor;
  Color darkWoodColor() => AppConstants.darkWoodColor;
  Color pendingColor() => AppConstants.pendingColor;
  Color goldenSunColor() => AppConstants.goldenSunColor;
  Color khakiColor() => AppConstants.khakiColor;
  Color crimsonColor() => AppConstants.crimsonColor;
  Color warmSandColor() => AppConstants.warmSand;
  Color accentColor() => AppConstants.accentColor;
  Color greyColor() => const Color(0xffEAEBEB);
  Color darkGreyColor() => const Color(0xffA0A0A0);

  TextStyle customStyle({
    FontWeight? fontWeight,
    Color? color,
    double? size,
    TextDecoration? decoration,
    double? letterSpacing,
    FontStyle? style,
  }) =>
      AppConstants.customNormal(
        color: color,
        size: size,
        weight: fontWeight,
        letterSpacing: letterSpacing,
        style: style,
      );

  TextStyle customBold({
    FontWeight fontWeight = FontWeight.w600,
    Color? color,
    double? size,
    TextDecoration? decoration,
    double? letterSpacing,
    FontStyle? style,
  }) =>
      AppConstants.custom(
        color: color,
        size: size,
        weight: fontWeight,
        letterSpacing: letterSpacing,
        style: style,
      );

  TextStyle customMedium(
          {FontWeight fontWeight = FontWeight.w500,
          Color? color,
          String? family,
          double size = 14.0,
          TextDecoration? decoration,
          double? letterSpacing,
          double? height,
          FontStyle? style,
          double? decorationThickness,
          Color? decorationColor}) =>
      AppConstants.splash(
          color: color,
          size: size,
          family: family,
          weight: fontWeight,
          letterSpacing: letterSpacing,
          style: style,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationThickness: decorationThickness,
          height: height);
}

extension IterableExtensions<E> on Iterable<E> {
  Iterable<List<E>> chunked(int chunkSize) sync* {
    if (length <= 0) {
      yield [];
      return;
    }
    int skip = 0;
    while (skip < length) {
      final chunk = this.skip(skip).take(chunkSize);
      yield chunk.toList(growable: false);
      skip += chunkSize;
      if (chunk.length < chunkSize) return;
    }
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension CapExtension on String {
  String get inCaps =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';

  String get allInCaps => toUpperCase();
  String get capitalizeFirstofEach => toLowerCase()
      .replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.inCaps)
      .join(' ');
}

extension StringEx on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
