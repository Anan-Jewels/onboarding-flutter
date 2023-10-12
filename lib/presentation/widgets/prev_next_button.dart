import 'package:anan_onboarding/main.dart';
import 'package:anan_onboarding/presentation/widgets/chip_icon.dart';
import 'package:flutter/material.dart';

class PrevNextButton extends StatelessWidget {
  final bool isPrevious;
  final bool allowSelection;
  final GestureTapCallback? onTap;

  const PrevNextButton({
    Key? key,
    this.allowSelection = false,
    this.isPrevious = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: isPrevious
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ChipIcon(
                  isBack: true,
                  isSelected: allowSelection,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Previous',
                  style: context.customStyle(
                    color: context.textColor(),
                    fontWeight: FontWeight.w600,
                    size: 16.0,
                  ),
                ),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Next',
                  style: context.customStyle(
                    color: context.textColor(),
                    fontWeight: FontWeight.w600,
                    size: 16.0,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                ChipIcon(
                  isBack: false,
                  isSelected: allowSelection,
                ),
              ],
            ),
    );
  }
}
