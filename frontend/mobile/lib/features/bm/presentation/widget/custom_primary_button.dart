import 'package:bm_mobile/core/style/style_extensions.dart';
import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final GlobalKey<FormState>? formKey;
  final String labelText;
  final void Function()? onPressed;

  const CustomPrimaryButton({
    super.key,
    this.formKey,
    required this.labelText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.primaryColor,
              context.grayColor,
            ],
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: 50.0,
          alignment: Alignment.center,
          child: Text(
            labelText.toUpperCase(),
            textAlign: TextAlign.center,
            style: context.primaryTextButton,
          ),
        ),
      ),
    );
  }
}
