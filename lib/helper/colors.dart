import 'package:anan_onboarding/helper/app_constants.dart';
import 'package:flutter/material.dart';

Color primaryColor = AppConstants.accentColor;
Color firstColor = const Color(0xFFFFC26A);
Color secondColor = const Color(0xFFFF8425);
Color thirdColor = const Color(0xFFFFC26A);
Color whiteColor = Colors.white;

focusedOutlineInputBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black),
    borderRadius: BorderRadius.circular(15),
  );
}

enabledOutlineInputBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black),
    borderRadius: BorderRadius.circular(15),
  );
}
