import 'package:bm_mobile/core/di.dart';
import 'package:bm_mobile/core/route_generator.dart';
import 'package:bm_mobile/features/bm/domain/entity/auth_user.dart';
import 'package:bm_mobile/features/bm/domain/usecase/authentication_user.dart';
import 'package:bm_mobile/features/bm/presentation/controller/auth/state/auth_state.dart';
import 'package:bm_mobile/features/bm/presentation/utility/show_custom_alert_dialog.dart';
import 'package:bm_mobile/features/bm/presentation/widget/custom_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthProvider extends Notifier<AuthState> {
  late AuthenticateUserUseCase _authenticateUserUseCase;

  @override
  AuthState build() {
    _authenticateUserUseCase = ref.watch(authenticateUserUseCaseProvider);
    return const AuthState.empty();
  }

  Future<void> login(BuildContext context, AuthUser authUser) async {
    state = const AuthState.loading();
    final result = await _authenticateUserUseCase(authUser);
    result.fold(
      (failure) {
        if (context.mounted) {
          showCustomAlertDialog(context, DialogType.error, "Wrong username or password!");
        }
        return state = const AuthState.error();
      },
      (tokens) {
        if (context.mounted) {
          ref.read(feedbackQuestionProvider.notifier).getFeedbackQuestion();
          ref.read(usersForFeedbackProvider.notifier).getUsersForFeedback();
          ref.read(feedbackStateProvider.notifier).getFeedback();
          Navigator.of(context).pushNamed(RouteGenerator.homeScreen);
        }
        return state = const AuthState.success();
      },
    );
  }
}
