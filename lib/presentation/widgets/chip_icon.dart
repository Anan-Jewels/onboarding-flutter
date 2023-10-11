import 'package:anan_onboarding/main.dart';
import 'package:flutter/material.dart';

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
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? context.black() : context.white(),
            border: Border.all(
              color: context.black(),
            ),
          ),
        ),
        Positioned(
          top: 12.0,
          left: isBack ? 4.0 : 0.0,
          right: 0.0,
          child: Icon(
            isBack ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
            color: isSelected ? context.white() : context.black(),
            size: 14.0,
          ),
        )
      ],
    );
  }
}
