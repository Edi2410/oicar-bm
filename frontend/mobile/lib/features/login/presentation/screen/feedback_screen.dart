import 'package:bm_mobile/core/di.dart';
import 'package:bm_mobile/core/style/style_extensions.dart';
import 'package:bm_mobile/features/bm/domain/entity/user_data.dart';
import 'package:bm_mobile/features/login/presentation/widget/feedback_form.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedbackScreen extends HookConsumerWidget {
  final UserData userData;
  const FeedbackScreen(this.userData, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersForFeedback = ref.read(usersForFeedbackProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedback',
          style: context.titleText,
        ),
        backgroundColor: context.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: usersForFeedback.when(
          loading: () => const Center(child: CircularProgressIndicator.adaptive()),
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          data: (users) => FeedbackForm(userData, users),
        ),
      ),
    );
  }
}
