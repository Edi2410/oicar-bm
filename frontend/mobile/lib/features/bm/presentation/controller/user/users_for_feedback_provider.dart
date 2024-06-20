import 'package:bm_mobile/core/di.dart';
import 'package:bm_mobile/features/bm/domain/entity/user_data.dart';
import 'package:bm_mobile/features/bm/domain/usecase/get_user_for_feedback.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersForFeedbackProvider extends Notifier<AsyncValue<List<UserData>>> {
  late GetUserForFeedbackUseCase _getUserForFeedbackUseCase;

  @override
  build() {
    _getUserForFeedbackUseCase = ref.watch(getUserForFeedbackUseCaseProvider);
    return const AsyncValue.loading();
  }

  Future<void> getUsersForFeedback() async {
    state = const AsyncValue.loading();
    try {
      var result = await _getUserForFeedbackUseCase.getUserForFeedback();
      result.fold(
        (failure) {
          state = AsyncValue.error(failure.toString(), StackTrace.current);
        },
        (users) {
          state = AsyncValue.data(users);
        },
      );
    } catch (error) {
      state = AsyncValue.error(error.toString(), StackTrace.current);
    }
  }
}
