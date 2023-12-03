import 'package:flutter/material.dart';

class CheckCheckBoxWidget extends StatelessWidget {
  const CheckCheckBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
       Image(
        image: AssetImage(
            "assets/images/checkbox.png"),
        height: 20,
        width: 20,
      );
  }
}
