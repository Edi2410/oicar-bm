import 'package:bm_mobile/core/di.dart';
import 'package:bm_mobile/features/bm/domain/entity/question.dart';
import 'package:bm_mobile/features/bm/domain/usecase/get_feedback_question.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedbackQuestionProvider extends Notifier<AsyncValue<List<Question>>> {
  late GetFeedbackQuestionUseCase _getFeedbackQuestionUseCase;

  @override
  build() {
    _getFeedbackQuestionUseCase = ref.watch(getFeedbackQuestionUseCaseProvider);
    throw const AsyncValue.loading();
  }

  Future<void> getFeedbackQuestion() async {
    state = const AsyncValue.loading();
    try {
      var result = await _getFeedbackQuestionUseCase.getFeedbackQuestion();
      result.fold(
        (failure) {
          state = AsyncValue.error(failure.toString(), StackTrace.current);
        },
        (data) {
          state = AsyncValue.data(data);
        },
      );
    } catch (error) {
      state = AsyncValue.error(error.toString(), StackTrace.current);
    }
  }
}
