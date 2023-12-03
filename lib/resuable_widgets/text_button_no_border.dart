import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class TextButtonWithoutBorder extends StatelessWidget {
  final String buttonText;
  final double buttonFontSize;
  final Color buttonTextColor;
  final Function onButtonClick;
  final double height;
  final Color buttonBackground;
  final double borderRadius;
  final bool containsIcon;

  const TextButtonWithoutBorder({
    Key? key,
    required this.buttonText,
    required this.onButtonClick,
    this.height = 50,
    this.buttonBackground = (AppColors.buttonColor),
    this.borderRadius = 12,
    this.buttonFontSize = 16,
    this.containsIcon = false,
    this.buttonTextColor = AppColors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onButtonClick();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          containsIcon
              ? const Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 20,
                )
              : Container(),
          const SizedBox(
            width: 8,
          ),
          Text(
            buttonText,
            style: TextStyle(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
