import 'package:bm_mobile/core/style/style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTextField extends ConsumerWidget {
  final String? Function(String?)? validation;
  final int maxLines;
  final String labelText;
  final TextEditingController controller;
  final Icon? icon;
  final bool isPasswordField;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.validation,
    this.maxLines = 1,
    this.icon,
    this.isPasswordField = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      obscureText: isPasswordField,
      enableSuggestions: !isPasswordField,
      autocorrect: !isPasswordField,
      maxLines: maxLines,
      controller: controller,
      validator: validation,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        prefixIcon: icon,
        labelStyle: TextStyle(color: context.primaryColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: context.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: context.borderColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: context.errorColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: context.errorColor,
          ),
        ),
        labelText: labelText,
      ),
    );
  }
}
