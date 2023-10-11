import 'package:flutter/material.dart';

const Size designRatio = Size(1080, 2400);

const String assetIconPath = 'assets/icons/';
const String assetImagePath = 'assets/images/';
const String placeHolder = 'assets/error.gif';
const String splashIcon = 'assets/svg/splash_icon.svg';
const String KtermsOfUse =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et tellus at quis lectus arcu enim. Lacus, sed eros lectus feugiat lectus justo. Duis nulla bibendum. \n \nLorem ipsum dolor sit amet, consectetur adipiscing elit. Et tellus at quis lectus arcu enim. Lacus, sed eros lectus feugiat lectus justo. Duis nulla bibendum. ipsum dolor sit amet, consectetur adipiscing elit. Et tellus at quis lectus arcu enim. Lacus, sed eros lectus feugiat lectus justo.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et tellus at quis lectus arcu enim. Lacus, sed eros lectus feugiat lectus justo. Duis nulla bibendum. \n  \nLorem ipsum dolor sit amet, consectetur adipiscing elit. Et tellus at quis lectus arcu enim. Lacus, sed eros lectus feugiat lectus justo. Duis nulla bibendum. ';

const Color whiteColor = Color(0xffffffff);
const Color textColor = Color(0xff333333);
const Color onPrimaryColor = whiteColor;
const Color onSecondaryColor = whiteColor;
const Color succesColor = Color(0xff0DC600);
const Color errorColor = Color(0xffFF2323);
const Color offerBgColor = Color(0xffEF4129);

final Color? greyColor = Colors.grey[200];
final Color? darkGreyColor = Colors.grey[600];

const Color inactiveGrey = Color(0xFFA7A6A6);
const Color borderColor = Color(0xFFECECEC);
const Color dividerColor = Color(0xFFD9D9D9);
const Color placeHolderColor = Color(0xFFF8F8F8);
const Color yellowColor = Color(0xFFFFBC00);

class AppConstants {
  AppConstants._();

  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: color,
      100: color,
      200: color,
      300: color,
      400: color,
      500: color,
      600: color,
      700: color,
      800: color,
      900: color,
    });
  }

  static const Color primaryColor = Color(0xFF242A6B);
  static const Color primaryColor2 = Color(0xFF233E8B);
  static const Color accentColor = Color(0xFFEEB702);
  static const Color blueSky = Color(0xFFC9D8DF);
  static const Color sageColor = Color(0xFF80A07D);
  static const Color crimsonColor = Color(0xFF932A24);
  static const Color pendingColor = Color(0xFFDBC823);
  static const Color deniedColor = Color(0xFFDBC823);
  static const Color khakiColor = Color(0xFFC4B193);
  static const Color goldenSunColor = Color(0xFFF3DC80);
  static const Color darkWoodColor = Color(0xFF321712);
  static const Color textColor = Color(0xFF98A29D);
  static const Color borderColor = Color(0xFFE0E2E1);
  static const Color accentGradient1 = Color(0xFF60797B);
  static const Color accentGradient2 = Color(0xFF7E9EA1);
  static const Color pastbookingCardColor = Color(0xffC9D8DF);
  static const Color canclebookingCardColor = Color(0xffE83737);
  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const Color green = Color(0xFF528E6C);
  static const Color dividerColor = Color(0xFF5BCEB9);
  static const Color dividerColor2 = Color(0xFFD4EFED);
  static const Color greenDark = Color(0xFF127039);
  static const Color white = Color(0xFFF8F8F7);
  static const Color black = Color(0xFF082017);
  static const Color warmSand = Color(0xFFE5DBD3);
  static const Color selectedBlackColor = Color(0xFF0a0a0a);
  static const String fontName = 'Whitney';
  static const Color darkGreen = Color(0xff082017);

  static TextStyle appBarText(double size) => TextStyle(
        color: white,
        fontWeight: FontWeight.bold,
        fontSize: size,
      );

  static TextStyle gridText(double size) => TextStyle(
        color: white,
        fontWeight: FontWeight.w500,
        fontSize: size,
      );

  static TextStyle headlineLight(double size) => TextStyle(
        // h5 -> headline
        fontWeight: FontWeight.bold,
        fontSize: size,
//        letterSpacing: 0.27,
        color: darkerText,
      );

  static TextStyle headlineDark(double size) => TextStyle(
        // h5 -> headline
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: white,
      );

  static TextStyle subtitleLight(double size) => TextStyle(
        // subtitle2 -> subtitle
        fontWeight: FontWeight.w400,
        fontSize: 14,
        letterSpacing: -0.04,
        color: black.withOpacity(0.5),
      );
  static TextStyle subtitleDark(double size) => TextStyle(
        // subtitle2 -> subtitle
        fontWeight: FontWeight.w400,
        fontSize: 14,
//        letterSpacing: -0.04,
        color: white.withOpacity(0.7),
      );

  static TextStyle customNormal({
    double? size,
    Color? color,
    FontWeight? weight,
    FontStyle? style,
    double? letterSpacing,
  }) =>
      TextStyle(
        // fontFamily: 'Freight Neo',
        fontFamily: 'FreightDisp Pro',
        fontWeight: weight ?? FontWeight.w600,
        fontSize: size,
        letterSpacing: letterSpacing,
        color: color,
        fontStyle: style,
      );

  static TextStyle splash(
          {double? size,
          String? family,
          Color? color,
          FontWeight? weight,
          FontStyle? style,
          double? height,
          double? letterSpacing,
          TextDecoration? decoration,
          double? decorationThickness,
          Color? decorationColor}) =>
      TextStyle(
        fontFamily: family ?? 'FreightDisp Pro',
        fontWeight: weight ?? FontWeight.w600,
        fontSize: size,
        letterSpacing: letterSpacing,
        color: color,
        fontStyle: style,
        decoration: decoration,
        decorationThickness: decorationThickness,
        decorationColor: decorationColor,
        decorationStyle: TextDecorationStyle.solid,
        height: height,
      );

  static TextStyle custom({
    double? size,
    Color? color,
    FontWeight? weight,
    double? letterSpacing,
    FontStyle? style,
  }) =>
      TextStyle(
        // fontFamily: 'Freight Disp',
        fontFamily: 'FreightDisp Pro',
        fontWeight: weight ?? FontWeight.w500,
        fontSize: size,
        letterSpacing: letterSpacing,
        color: color,
        fontStyle: style,
      );

  static const Map<String, dynamic> amenities = {
    'POOL': 'assets/amenties/swimming_pool.svg',
    'LOUNGE': 'assets/amenties/loungue.svg',
    'WIFI': 'assets/amenties/wifi.svg',
    'GYM': 'assets/amenties/gym.svg',
    'TV_ROOM': 'assets/amenties/television.svg',
    'PARKING': 'assets/amenties/parking.svg',
    'PROFESSIONALLY_DECORATED': 'assets/amenties/professionally_decorated.svg',
    'WELL_EQUIPPED_KITCHEN': 'assets/amenties/well_equipped_kitchen.svg',
    'PRIVATE_SWIMMING_POOL': 'assets/amenties/swimming_pool.svg',
    'OWNERS_STORAGE_FACILITY': 'assets/amenties/owner_storage_facility.svg',
    'HOUSE_HELP_AND_SECURITY': 'assets/amenties/house_help_and_security.svg',
    'ITALIAN_COFFEE_MACHINE': 'assets/amenties/coffe_mechine.svg',
    'FULLY_FURNISHED': 'assets/amenties/fully_furnished.svg',
    'KID_FRIENDLY': 'assets/amenties/kids freindly.svg',
    'CHEF_ON_CALL': 'assets/amenties/chef_on_call.svg',
    'OPEN_DECK': 'assets/amenties/open_deck.svg',
    'BALCONY_WITH_BAR': 'assets/amenties/balcony_with_bar.svg',
    'LARGE_GARDEN': 'assets/amenties/loungue.svg',
    'MOUNTAIN_VIEWS': 'assets/amenties/mountain_view.svg',
    'MOUNTAIN_VIEW': 'assets/amenties/mountain_view.svg',
    'WELL_EQUIPPED_WET_AND_DRY_KITCHEN':
        'assets/amenties/well_equipped_kitchen.svg',
    'HOUSE_HELP': 'assets/amenties/house_help_and_security.svg',
    'OUTDOOR_HOT_TUB': 'assets/amenties/hot_bathtub.svg',
    'HIKING_TRAIL_ACCESS': 'assets/amenties/hiking_trail_access.svg',
    'BATHS_COUNT': 'assets/amenties/bath.svg',
    'BEDS_COUNT': 'assets/amenties/bed.svg',
    'AREA_SQFT': 'assets/amenties/area.svg',
    'EXTRA5': 'assets/amenties/Default_picture.svg',
  };
}
