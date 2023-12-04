library provider_app_device;

import 'package:flutter/material.dart';

/// calculated device height, width and scalable pixels.
extension RatioExtension on num {
  /// calculate device height.
  double hPr(BuildContext context) =>
      MediaQuery.of(context).size.height * (this / 844);

  /// calculate device width.
  double wPr(BuildContext context) =>
      MediaQuery.of(context).size.width * (this / 390);

  /// calculate device scalable pixel.
  double scp(BuildContext context) =>
      this *
      (((hPr(context) + wPr(context)) +
              (MediaQuery.of(context).devicePixelRatio *
                  MediaQuery.of(context).size.aspectRatio)) /
          2.08) /
      100;
}
