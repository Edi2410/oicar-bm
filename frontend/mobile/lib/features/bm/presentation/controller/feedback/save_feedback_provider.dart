import 'package:bm_mobile/core/di.dart';
import 'package:bm_mobile/features/bm/domain/entity/feedback.dart';
import 'package:bm_mobile/features/bm/domain/usecase/save_feedback.dart';
import 'package:bm_mobile/features/bm/presentation/utility/show_custom_alert_dialog.dart';
import 'package:bm_mobile/features/bm/presentation/widget/custom_alert_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SaveFeedbackProvider extends Notifier<AsyncValue<void>> {
  late SaveFeedbackUseCase _saveFeedbackUseCase;

  @override
  build() {
    _saveFeedbackUseCase = ref.watch(saveFeedbackUseCaseProvider);
    throw const AsyncValue.loading();
  }

  Future<void> saveFeedback(BuildContext context, FeedbackSaveData feedbackForm) async {
    state = const AsyncValue.loading();
    try {
      var result = await _saveFeedbackUseCase.saveFeedback(feedbackForm);
      result.fold(
        (failure) {
          if (context.mounted) {
            showCustomAlertDialog(context, DialogType.error, "Failed to save feedback!");
          }
          return state = AsyncValue.error(failure.toString(), StackTrace.current);
        },
        (tokens) {
          if (context.mounted) {
            showCustomAlertDialog(context, DialogType.success, "Feedback saved successfully!");
          }
          return state = const AsyncValue.data(null);
        },
      );
    } catch (error) {
      state = AsyncValue.error(error.toString(), StackTrace.current);
    }
  }
}
