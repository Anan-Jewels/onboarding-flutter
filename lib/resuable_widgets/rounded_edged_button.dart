import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class RoundedEdgedButton extends StatelessWidget {
  final String buttonText;
  final double buttonFontSize;
  final Color buttonTextColor;
  final Function onButtonClick;
  final double height;
  final Color buttonBackground;
  final double borderRadius;

  const RoundedEdgedButton({
    Key? key,
    required this.buttonText,
    required this.onButtonClick,
    this.height = 50,
    this.buttonBackground = (AppColors.buttonColor),
    this.borderRadius = 12,
    this.buttonFontSize = 16,
    this.buttonTextColor = AppColors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onButtonClick();
      },
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: buttonBackground,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                color: buttonTextColor,
                fontSize: buttonFontSize,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
