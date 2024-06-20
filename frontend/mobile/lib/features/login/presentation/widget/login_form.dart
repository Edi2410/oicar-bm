import 'package:bm_mobile/core/di.dart';
import 'package:bm_mobile/core/route_generator.dart';
import 'package:bm_mobile/core/style/style_extensions.dart';
import 'package:bm_mobile/features/bm/domain/entity/auth_user.dart';
import 'package:bm_mobile/features/bm/presentation/widget/custom_primary_button.dart';
import 'package:bm_mobile/features/bm/presentation/widget/input_form/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends HookConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.cardBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: context.shadowColor,
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextField(
              controller: usernameController,
              labelText: "Username",
              validation: (value) => _validateTextField(context, value),
              icon: Icon(
                Icons.person_2_outlined,
                color: context.primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              isPasswordField: true,
              controller: passwordController,
              labelText: "Password",
              validation: (value) => _validateTextField(context, value),
              icon: Icon(
                Icons.lock_outline,
                color: context.primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            CustomPrimaryButton(
              labelText: "Log in",
              onPressed: () => _login(context, ref, formKey, usernameController, passwordController),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _login(
    BuildContext context,
    WidgetRef ref,
    GlobalKey<FormState> formKey,
    TextEditingController usernameController,
    TextEditingController passwordController,
  ) async {
    if (formKey.currentState!.validate()) {
      ref.read(authStateProvider.notifier).login(
          context,
          AuthUser(
            username: usernameController.text,
            password: passwordController.text,
          ));
    }
  }

  String? _validateTextField(BuildContext context, final String? value) {
    if (value == null || value.isEmpty) {
      return "Field is empty";
    }
    return null;
  }
}
