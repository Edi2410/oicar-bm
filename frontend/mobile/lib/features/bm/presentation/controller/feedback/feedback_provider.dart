import 'package:bm_mobile/core/di.dart';
import 'package:bm_mobile/features/bm/domain/usecase/get_feedback.dart';
import 'package:bm_mobile/features/bm/presentation/controller/feedback/state/feedback_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedbackProvider extends Notifier<FeedbackState> {
  late GetFeedbackUseState _getFeedbackUseState;

  @override
  FeedbackState build() {
    _getFeedbackUseState = ref.watch(getFeedbackUseCaseProvider);
    return const FeedbackState.loading();
  }

  Future<void> getFeedback() async {
    state = const FeedbackState.loading();
    final result = await _getFeedbackUseState.getFeedback();
    result.fold(
      (failure) {
        return state = const FeedbackState.error();
      },
      (data) {
        print("!!! data comment ${data.comment}");
        print("!!! data grade ${data.grades.toList()}");
        if (data.grades.isEmpty && data.comment.isEmpty) {
          return state = const FeedbackState.empty();
        }
        return state = FeedbackState.success(data);
      },
    );
  }
}
