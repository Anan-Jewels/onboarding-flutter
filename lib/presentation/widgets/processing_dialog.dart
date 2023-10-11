import 'package:anan_onboarding/helper/ui_helpers.dart';
import 'package:anan_onboarding/main.dart';
import 'package:flutter/material.dart';

class ProcessingDialog extends StatefulWidget {
  final String message;
  const ProcessingDialog({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  State<ProcessingDialog> createState() => _ProcessingDialogState();
}

class _ProcessingDialogState extends State<ProcessingDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      elevation: 5.0,
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(context.primaryColor()),
              ),
              UIHelper.verticalSpace(20.0),
              Flexible(
                flex: 1,
                child: Center(
                  child: Text(
                    widget.message,
                    textAlign: TextAlign.center,
                    style: context.customStyle(
                      size: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
