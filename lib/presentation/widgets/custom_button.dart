import 'package:anan_onboarding/helper/Helper.dart';
import 'package:anan_onboarding/helper/app_constants.dart';
import 'package:anan_onboarding/main.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    this.bg = AppConstants.accentColor,
    this.radius = 4.0,
    this.textColor = AppConstants.white,
    required this.onTap,
    this.text,
    this.style,
    this.shadow = false,
    this.height = 48.0,
    this.showBorder = false,
    this.showLoading = false,
    this.showMargin = true,
    this.borderColor = AppConstants.black,
  }) : super(key: key);

  final Color bg;
  final Color textColor;
  final Color borderColor;
  final double radius;
  final String? text;
  final bool shadow;
  final bool showMargin;
  final bool showBorder;
  final bool showLoading;
  final double height;
  final TextStyle? style;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.getQuery().viewInsets.bottom),
      child: Ink(
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: shadow
              ? [
                  // BoxShadow(
                  //   offset: const Offset(1.0, 5.0),
                  //   color: AppConstants.black.withOpacity(0.1),
                  //   blurRadius: 8.0,
                  //   spreadRadius: 3.0,
                  // ),
                  const BoxShadow(
                    color: Color(0x1923004C),
                    blurRadius: 5,
                    offset: Offset(2, 2),
                    spreadRadius: 2,
                  ),
                ]
              : null,
          border: showBorder ? Border.all(color: borderColor) : null,
        ),
        child: InkWell(
          onTap: onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Container(
            margin: showMargin
                ? const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  )
                : null,
            height: height,
            // decoration: BoxDecoration(
            //   color: bg,
            //   borderRadius: BorderRadius.circular(radius),
            //   boxShadow: shadow
            //       ? [
            //           // BoxShadow(
            //           //   offset: const Offset(1.0, 5.0),
            //           //   color: AppConstants.black.withOpacity(0.1),
            //           //   blurRadius: 8.0,
            //           //   spreadRadius: 3.0,
            //           // ),
            //           const BoxShadow(
            //             color: Color(0x1923004C),
            //             blurRadius: 5,
            //             offset: Offset(2, 2),
            //             spreadRadius: 2,
            //           ),
            //         ]
            //       : null,
            //   border: showBorder ? Border.all(color: borderColor) : null,
            // ),
            alignment: Alignment.center,
            child: showLoading
                ? loadingIcon(
                    color: AppConstants.white,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text!,
                        style: style != null
                            ? style!
                            : context.customStyle(
                                size: 16.0,
                                color: textColor,
                                fontWeight: FontWeight.w500,
                              ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
