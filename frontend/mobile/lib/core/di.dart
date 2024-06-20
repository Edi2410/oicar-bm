import 'package:bm_mobile/features/bm/data/api/auth_api_client.dart';
import 'package:bm_mobile/features/bm/data/api/auth_interceptor.dart';
import 'package:bm_mobile/features/bm/data/api/feedback_api_client.dart';
import 'package:bm_mobile/features/bm/data/api/users_api_client.dart';
import 'package:bm_mobile/features/bm/data/repository/auth_repository_impl.dart';
import 'package:bm_mobile/features/bm/data/repository/feedback_repository_impl.dart';
import 'package:bm_mobile/features/bm/data/repository/users_repository_impl.dart';
import 'package:bm_mobile/features/bm/domain/entity/question.dart';
import 'package:bm_mobile/features/bm/domain/entity/user_data.dart';
import 'package:bm_mobile/features/bm/domain/usecase/authentication_user.dart';
import 'package:bm_mobile/features/bm/domain/usecase/get_feedback.dart';
import 'package:bm_mobile/features/bm/domain/usecase/get_feedback_question.dart';
import 'package:bm_mobile/features/bm/domain/usecase/get_user_data.dart';
import 'package:bm_mobile/features/bm/domain/usecase/get_user_for_feedback.dart';
import 'package:bm_mobile/features/bm/domain/usecase/save_feedback.dart';
import 'package:bm_mobile/features/bm/presentation/controller/auth/auth_provider.dart';
import 'package:bm_mobile/features/bm/presentation/controller/auth/state/auth_state.dart';
import 'package:bm_mobile/features/bm/presentation/controller/feedback/feedback_provider.dart';
import 'package:bm_mobile/features/bm/presentation/controller/feedback/feedback_question_provider.dart';
import 'package:bm_mobile/features/bm/presentation/controller/feedback/save_feedback_provider.dart';
import 'package:bm_mobile/features/bm/presentation/controller/feedback/state/feedback_state.dart';
import 'package:bm_mobile/features/bm/presentation/controller/user/state/user_state.dart';
import 'package:bm_mobile/features/bm/presentation/controller/user/users_for_feedback_provider.dart';
import 'package:bm_mobile/features/bm/presentation/controller/user/users_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

//EXTERNAL
final dioProvider = Provider<Dio>(
  (ref) => Dio()..interceptors.add(AuthInterceptor()),
);

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('access_token');
}

//API
final authUserApiProvider = Provider<AuthApiClient>(
  (ref) => AuthApiClient(ref.watch(dioProvider)),
);
final userApiProvider = Provider<UsersApiClient>(
  (ref) => UsersApiClient(ref.watch(dioProvider)),
);

final feedbackApiProvider = Provider<FeedbackApiClient>(
  (ref) => FeedbackApiClient(ref.watch(dioProvider)),
);

//REPOSITORY
final authUserRepositoryProvider = Provider<AuthRepositoryImpl>(
  (ref) => AuthRepositoryImpl(ref.watch(authUserApiProvider)),
);
final userRepositoryProvider = Provider<UsersRepositoryImpl>(
  (ref) => UsersRepositoryImpl(ref.watch(userApiProvider)),
);
final feedbackRepositoryProvider = Provider<FeedbackRepositoryImpl>(
  (ref) => FeedbackRepositoryImpl(ref.watch(feedbackApiProvider)),
);

//USE CASES
final authenticateUserUseCaseProvider = Provider<AuthenticateUserUseCase>(
  (ref) => AuthenticateUserUseCase(ref.watch(authUserRepositoryProvider)),
);

final getUserDataUseCaseProvider = Provider<GetUserDataUseCase>(
  (ref) => GetUserDataUseCase(ref.watch(userRepositoryProvider)),
);

final getUserForFeedbackUseCaseProvider = Provider<GetUserForFeedbackUseCase>(
  (ref) => GetUserForFeedbackUseCase(ref.watch(userRepositoryProvider)),
);

final getFeedbackQuestionUseCaseProvider = Provider<GetFeedbackQuestionUseCase>(
  (ref) => GetFeedbackQuestionUseCase(ref.watch(feedbackRepositoryProvider)),
);

final saveFeedbackUseCaseProvider = Provider<SaveFeedbackUseCase>(
  (ref) => SaveFeedbackUseCase(ref.watch(feedbackRepositoryProvider)),
);

final getFeedbackUseCaseProvider = Provider<GetFeedbackUseState>(
  (ref) => GetFeedbackUseState(ref.watch(feedbackRepositoryProvider)),
);

//CONTROLLER
final authStateProvider = NotifierProvider<AuthProvider, AuthState>(
  () => AuthProvider(),
);

final userStateProvider = NotifierProvider<UsersProvider, UserState>(
  () => UsersProvider(),
);

final feedbackStateProvider = NotifierProvider<FeedbackProvider, FeedbackState>(
  () => FeedbackProvider(),
);

final usersForFeedbackProvider = NotifierProvider<UsersForFeedbackProvider, AsyncValue<List<UserData>>>(
  () => UsersForFeedbackProvider(),
);

final feedbackQuestionProvider = NotifierProvider<FeedbackQuestionProvider, AsyncValue<List<Question>>>(
  () => FeedbackQuestionProvider(),
);

final saveFeedbackProvider = NotifierProvider<SaveFeedbackProvider, AsyncValue<void>>(
      () => SaveFeedbackProvider(),
);
