import 'dart:developer';

import 'package:anan_onboarding/helper/app_constants.dart';
import 'package:anan_onboarding/injection.dart';
import 'package:anan_onboarding/main.dart';
import 'package:anan_onboarding/presentation/widgets/dotted_line.dart';
import 'package:anan_onboarding/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class Helper {
  static padding({
    double horizontal = 0.0,
    double vertical = 0.0,
  }) =>
      EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      );
  static paddingOption({
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) =>
      EdgeInsets.only(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
      );

  static divider(
          {double left = 12.0,
          right = 12.0,
          double thickness = 1.0,
          double height = 2.0,
          Color? color}) =>
      Divider(
        endIndent: left,
        indent: right,
        thickness: thickness,
        height: height,
        color: color ?? AppConstants.black.withOpacity(0.2),
      );
  static dottedDivider(
          {double left = 12.0,
          right = 12.0,
          double thickness = 1.0,
          double height = 2.0,
          Color? color}) =>
      Padding(
        padding: paddingOption(
          left: left,
          right: right,
        ),
        child: DottedLine(
          dashColor: color ?? AppConstants.black.withOpacity(0.2),
          dashGapColor: AppConstants.white,
          lineThickness: thickness,
        ),
      );

  Future<void> showBottomSheet(
      {required BuildContext context, required Widget child}) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      barrierColor: context.blueSkyColor().withOpacity(0.4),
      backgroundColor: Colors.transparent,
      builder: (context) => child,
    );
  }

  static setUIOverlayStyle({required Color color, bool dark = false}) {
    if (dark) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: color, statusBarBrightness: Brightness.dark),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
            statusBarColor: color, statusBarBrightness: Brightness.light),
      );
    }
  }

  static bool isRequestSuccess(int? statusCode) {
    return statusCode == 200 || statusCode == 204;
  }

  static String getTimeWithAmPm(String time, String dateTime) {
    return '${int.parse(time.split(':')[0]) > 13 ? int.parse(time.split(':')[0]) - 12 : int.parse(time.split(':')[0])}:${time.split(':')[1]} ${TimeOfDay.fromDateTime(DateTime.parse(dateTime)).periodOffset == 0 ? 'am' : 'pm'}';
  }

  static String stringForDatetime(String dt) {
    var dtInLocal = DateTime.parse(dt).add(const Duration(
      hours: 5,
      minutes: 30,
    ));
    //DateTime.fromMillisecondsSinceEpoch( 1490489845  * 1000).toLocal(); //year:  1490489845 //>day: 1556152819  //month:  1553561845  //<day: 1556174419
    var now = DateTime.now().toLocal();
    var dateString = ' ';

    var diff = now.difference(dtInLocal);

    if (now.day == dtInLocal.day) {
      // creates format like: 12:35 PM,
      var todayFormat = DateFormat('h:mm a');
      dateString += todayFormat.format(dtInLocal);
    } else if ((diff.inDays) == 1 ||
        (diff.inSeconds < 86400 && now.day != dtInLocal.day)) {
      var yesterdayFormat = DateFormat('MMM d, h:mm a');
//      dateString += "Yesterday, " + yesterdayFormat.format(dtInLocal);
      dateString += yesterdayFormat.format(dtInLocal);
    } else if (now.year == dtInLocal.year && diff.inDays > 30) {
      var monthFormat = DateFormat('MMM d, h:mm a');
      dateString += monthFormat.format(dtInLocal);
    } else {
      var yearFormat = DateFormat('MMM d y');
      dateString += yearFormat.format(dtInLocal);
    }

    return dateString;
  }

  static String formatDate(String? dt) {
    if (dt != null) {
      var dtInLocal = DateTime.parse(dt);
//    var format = DateFormat("y/MM/d");
      var format = DateFormat('dd-MM-yyyy');
//    var format = DateFormat.YEAR_NUM_MONTH_DAY;

      return format.format(dtInLocal);
    } else {
      return '';
    }
  }

  static String formatDateYear(String? dt) {
    if (dt != null) {
      var dtInLocal = DateTime.parse(dt);
//    var format = DateFormat("y/MM/d");
      var format = DateFormat('yyyy-MM-dd');
//    var format = DateFormat.YEAR_NUM_MONTH_DAY;

      return format.format(dtInLocal);
    } else {
      return '';
    }
  }

  static String formatTime(String dt) {
    var dtInLocal = DateTime.parse(dt);
//    var format = DateFormat("y/MM/d");
    var format = DateFormat('hh:mm:ss');
//    var format = DateFormat.YEAR_NUM_MONTH_DAY;

    return format.format(dtInLocal);
  }

  static String formatWithFormat(String? dt, String format) {
    if (dt != null && dt.isNotEmpty) {
      var dtInLocal = DateTime.parse(dt);
//    var format = DateFormat("y/MM/d");
      var f = DateFormat(format);
//    var format = DateFormat.YEAR_NUM_MONTH_DAY;

      return f.format(dtInLocal);
    } else {
      return '';
    }
  }

  static String timeAgo(String? dt) {
    if (dt != null && dt.isNotEmpty) {
      Duration diff = DateTime.now().difference(DateTime.parse(dt));
      if (diff.inDays > 365) {
        return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
      }
      if (diff.inDays > 30) {
        return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "m" : "m"} ago";
      }
      if (diff.inDays > 7) {
        return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "w" : "w"} ago";
      }
      if (diff.inDays > 0) {
        return "${diff.inDays} ${diff.inDays == 1 ? "day" : "day"} ago";
      }
      if (diff.inHours > 0) {
        return "${diff.inHours} ${diff.inHours == 1 ? "h" : "h"} ago";
      }
      if (diff.inMinutes > 0) {
        return "${diff.inMinutes} ${diff.inMinutes == 1 ? "mins." : "mins."} ago";
      }
      return "just now";
    } else {
      return '';
    }
  }

  static String formatTimeAm(String? dt) {
    if (dt != null) {
      var dtInLocal = DateTime.parse(dt);
//    var format = DateFormat("y/MM/d");
      var format = DateFormat('hh:mm a');
//    var format = DateFormat.YEAR_NUM_MONTH_DAY;

      return format.format(dtInLocal);
    } else {
      return '';
    }
  }

  static String formatDateMonth(String? dt) {
    if (dt != null) {
      var dtInLocal = DateTime.parse(dt);
//    var format = DateFormat("y/MM/d");
      var format = DateFormat('dd MMM yyyy');
//    var format = DateFormat.YEAR_NUM_MONTH_DAY;

      return format.format(dtInLocal);
    } else {
      return '';
    }
  }

  static String stringForDatetimeDT(DateTime dt) {
    var dtInLocal = dt.toLocal().add(const Duration(
          hours: 5,
          minutes: 30,
        ));
    log('DATE: $dtInLocal');
    //DateTime.fromMillisecondsSinceEpoch( 1490489845  * 1000).toLocal(); //year:  1490489845 //>day: 1556152819  //month:  1553561845  //<day: 1556174419
    var now = DateTime.now().toLocal();
    var dateString = ' ';

    var diff = now.difference(dtInLocal);

    if (now.day == dtInLocal.day) {
      // creates format like: 12:35 PM,
//      var todayFormat = DateFormat("h:mm a");
      dateString += 'Today';
    } else if ((diff.inDays) == 1 ||
        (diff.inSeconds < 86400 && now.day != dtInLocal.day)) {
      var yesterdayFormat = DateFormat('MMM d');
      dateString += yesterdayFormat.format(dtInLocal);
    } else if (now.year == dtInLocal.year && diff.inDays > 1) {
      var monthFormat = DateFormat('MMM d');
      dateString += monthFormat.format(dtInLocal);
    } else {
      var yearFormat = DateFormat('MMM d y');
      dateString += yearFormat.format(dtInLocal);
    }

    return dateString;
  }

  static String getDayOfMonthSuffix(int dayNum) {
    if (!(dayNum >= 1 && dayNum <= 31)) {
      return '__';
    }

    if (dayNum >= 11 && dayNum <= 13) {
      return '${dayNum}th';
    }

    switch (dayNum % 10) {
      case 1:
        return '${dayNum}st';
      case 2:
        return '${dayNum}nd';
      case 3:
        return '${dayNum}rd';
      default:
        return '${dayNum}th';
    }
  }

  static String getMonthName(int number) {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[number - 1];
  }
}

Widget loadingIcon(
        {Color color = AppConstants.primaryColor, bool isFull = false}) =>
    isFull
        ? Container(
            height: locator<NavigationService>()
                    .navigatorKey
                    .currentContext!
                    .getHeight() *
                0.7,
            alignment: Alignment.center,
            child: SpinKitThreeBounce(
              color: color,
              size: 20.0,
            ),
          )
        : SpinKitThreeBounce(
            color: color,
            size: 20.0,
          );

extension Capitalized on String {
  String capitalized() =>
      substring(0, 1).toUpperCase() + substring(1).toLowerCase();
}
