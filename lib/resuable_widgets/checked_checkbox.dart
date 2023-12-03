import 'package:flutter/material.dart';
import 'package:onboarding_project/utils/app_images.dart';

class CheckCheckBoxWidget extends StatelessWidget {
  const CheckCheckBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
       const Image(
        image: AssetImage(
            AppImages.onboardCheckBox),
        height: 20,
        width: 20,
      );
  }
}
