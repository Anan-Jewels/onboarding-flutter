import 'package:flutter/cupertino.dart';

class SuccessDialog {
  static void dialog(context, label,
      {onClose, showCloseBtn = false, onOkTap}) async {
    showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () => Future.value(false),
        child: CupertinoAlertDialog(
          title: const Text('You have successfully saved'),
          content: Text(label),
          actions: [
            CupertinoDialogAction(
              onPressed: () async {
                onOkTap();
              },
              child: const Text('ok'),
            ),
          ],
        ),
      ),
    ).then((value) {
      if (onClose != null) {
        onClose();
      }
    });
  }
}
