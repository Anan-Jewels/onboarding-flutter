import 'package:anan_onboarding/presentation/widgets/Shimmer/helpers/helpers.dart';
import 'package:anan_onboarding/presentation/widgets/Shimmer/values/avatar_position.dart';
import 'package:anan_onboarding/presentation/widgets/Shimmer/values/value.dart';
import 'package:flutter/material.dart';

import 'line.dart';
import 'rectangle.dart';

class FluttonItemAvatarShimmering extends StatelessWidget
    with FluttonShimmeringHelpers {
  ///
  /// @param countLine => each item, how many line you need
  /// @param widthAvatar => width avatar
  /// @param heightAvatar => height avatar
  /// @param widthLine => width rectangle
  /// @param heightLine => height rectangle
  /// @param radiusLine (optional) => radius for line
  /// @param lastWidthLine (optional) => width end line for each item
  /// @param avatarPosition (optional, by default on top) => position avatar each item
  /// @param radiusAvatar (optional) => radius avatar
  ///
  FluttonItemAvatarShimmering({
    Key? key,
    @required this.widthAvatar,
    @required this.heightAvatar,
    @required this.widthLine,
    @required this.heightLine,
    this.radiusLine,
    this.lastWidthLine,
    this.countLine = defaultCountLine,
    this.radiusAvatar = defaultRadius,
    this.avatarPosition = FluttonShimmeringAvatarPosition.TOP,
  })  : _avatarPosition = avatarPosition == FluttonShimmeringAvatarPosition.TOP
            ? CrossAxisAlignment.start
            : avatarPosition == FluttonShimmeringAvatarPosition.MIDDLE
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.end,
        _lastWidthLine = lastWidthLine == null ? widthLine : lastWidthLine,
        super(key: key);

  final int? countLine;
  final double? widthAvatar;
  final double? heightAvatar;
  final double? widthLine;
  final double? heightLine;
  final double? lastWidthLine;
  final double? _lastWidthLine;
  final double? radiusAvatar;
  final double? radiusLine;
  final FluttonShimmeringAvatarPosition? avatarPosition;

  final CrossAxisAlignment? _avatarPosition;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: _avatarPosition!,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: RectangleShimmering(
              width: widthAvatar!,
              height: heightAvatar!,
              radius: radiusAvatar!,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              countLine!,
              (int index) => Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: LineShimmer(
                  width: determineValueByComparasion<int, int>(
                          index, countLine! - 1)<double, double>(
                      widthLine, _lastWidthLine),
                  height: heightLine!,
                  radius: radiusLine!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
