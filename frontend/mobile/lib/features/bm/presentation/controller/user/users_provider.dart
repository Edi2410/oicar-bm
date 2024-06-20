import 'package:bm_mobile/core/di.dart';
import 'package:bm_mobile/features/bm/domain/usecase/get_user_data.dart';
import 'package:bm_mobile/features/bm/presentation/controller/user/state/user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersProvider extends Notifier<UserState> {
  late GetUserDataUseCase _getUserDataUseCase;

  @override
  UserState build() {
    _getUserDataUseCase = ref.watch(getUserDataUseCaseProvider);
    getUserData();
    return const UserState.loading();
  }

  Future<void> getUserData() async {
    state = const UserState.loading();
    final result = await _getUserDataUseCase.getUser();
    result.fold(
      (failure) {
        return state = const UserState.error();
      },
      (userData) {
        return state = UserState.success(userData);
      },
    );
  }
}
