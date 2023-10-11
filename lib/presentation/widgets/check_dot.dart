import 'package:anan_onboarding/main.dart';
import 'package:flutter/material.dart';

class CheckDot extends StatelessWidget {
  final bool isSelected;
  const CheckDot({
    Key? key,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      padding: const EdgeInsets.all(3.0),
      width: 20.0,
      height: 20.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? context.darkGreyColor() : Colors.transparent,
        border: Border.all(
          color: isSelected ? context.darkGreyColor() : context.black(),
        ),
      ),
      child: Center(
        child: Icon(
          Icons.check,
          color: isSelected ? context.white() : Colors.transparent,
          size: 12.0,
        ),
      ),
    );
  }
}
