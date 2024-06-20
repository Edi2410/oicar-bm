import 'package:bm_mobile/core/style/style_extensions.dart';
import 'package:flutter/material.dart';

enum DialogType { success, error }

class CustomAlertDialog extends StatelessWidget {
  final DialogType type;
  final String message;

  const CustomAlertDialog({
    super.key,
    required this.type,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.surface,
        ),
        height: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              type == DialogType.success ? Icons.check_circle_outline_rounded : Icons.error_outline_rounded,
              color: type == DialogType.success ? const Color(0xFF1DB75F) : const Color(0xFFA91818),
              size: 65,
            ),
            const SizedBox(height: 5),
            Text(
              type == DialogType.success ? "SUCCESS" : "ERROR",
              style: context.titleText,
            ),
            const SizedBox(height: 20),
            Text(
              message,
              style: context.subtitleText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
