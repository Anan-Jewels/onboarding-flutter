import 'package:flutter/material.dart';

Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  return displaySize(context).width;
}

double getHeight(double value, BuildContext context) {
  double height = value / 670;
  double finalHeight = displayHeight(context) * height;
  return finalHeight;
}

double getWidth(double value, BuildContext context) {
  double width = value / 420;
  double finalWidth = displayWidth(context) * width;
  return finalWidth;
}
