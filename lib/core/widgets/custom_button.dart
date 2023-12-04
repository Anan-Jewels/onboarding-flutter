import 'package:flutter/material.dart';

import '../core.dart';

class CustomFlatButton extends StatelessWidget {
  final Color? color;
  final String title;
  final bool? isPrevious;
  final VoidCallback onTap;
  const CustomFlatButton(
      {super.key,
      this.color,
      required this.title,
      this.isPrevious = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color ?? neutral800Color,
        ),
        width: MediaQuery.of(context).size.width / 2 - 25,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isPrevious ?? false) ...{
                const Icon(
                  Icons.arrow_back_ios,
                  color: neutral800Color,
                  size: 16,
                ),
                const SizedBox(
                  width: 8,
                )
              },
              Text(
                title,
                style: FontUtilities.style(
                  fontSize: 16,
                  fontWeight: FWT.medium,
                  fontColor: color == null ? whiteColor : neutral800Color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
