import 'package:anan_onboarding/helper/app_constants.dart';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:anan_onboarding/helper/app_constants.dart';

class CircleShimmer extends StatelessWidget {
  ///
  /// @param width => width circle
  /// @param height => height circle
  ///
  const CircleShimmer({
    Key? key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppConstants.black.withOpacity(0.1),
      highlightColor: AppConstants.white.withOpacity(0.2),
      direction: ShimmerDirection.ltr,
      period: const Duration(seconds: 1),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(0.08),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
