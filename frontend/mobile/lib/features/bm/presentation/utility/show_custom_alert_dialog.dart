import 'package:bm_mobile/features/bm/presentation/widget/custom_alert_dialog.dart';
import 'package:flutter/material.dart';

void showCustomAlertDialog(BuildContext context, final DialogType type, final String message) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      Future.delayed(const Duration(seconds: 1), () => Navigator.of(context).pop());
      return CustomAlertDialog(
        type: type,
        message: message,
      );
    },
  );
}
