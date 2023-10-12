import 'package:anan_onboarding/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChipIcon extends StatelessWidget {
  final bool isBack;
  final bool isSelected;
  const ChipIcon({
    Key? key,
    this.isBack = false,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      child: SvgPicture.asset(
        getIcon(),
      ),
    );
  }

  String getIcon() {
    String icon;
    if (isBack) {
      icon = 'assets/svg/previous_arrow.svg';
    } else {
      if (isSelected) {
        icon = 'assets/svg/next_arrow_selected.svg';
      } else {
        icon = 'assets/svg/next_arrow.svg';
      }
    }
    return icon;
  }
}
