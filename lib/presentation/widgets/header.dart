import 'package:anan_onboarding/main.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25.0,
              horizontal: 16.0,
            ),
            child: LinearProgressIndicator(
              color: Colors.black,
              backgroundColor: Colors.grey[400],
              value: 0.25,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 20.0,
              bottom: 20.0,
            ),
            child: Text(
              'Choose some designs styles that you would prefer.',
              style: context.customStyle(
                color: context.textColor(),
                size: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
