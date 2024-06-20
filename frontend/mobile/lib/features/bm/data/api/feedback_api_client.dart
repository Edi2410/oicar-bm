import 'package:bm_mobile/features/bm/domain/entity/auth_user.dart';
import 'package:bm_mobile/features/bm/domain/entity/comments_and_grades.dart';
import 'package:bm_mobile/features/bm/domain/entity/feedback.dart';
import 'package:bm_mobile/features/bm/domain/entity/question.dart';
import 'package:bm_mobile/features/login/presentation/widget/feedback_form.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'feedback_api_client.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:8000/api/feedback/')
abstract class FeedbackApiClient {
  factory FeedbackApiClient(Dio dio, {String baseUrl}) = _FeedbackApiClient;

  @GET('')
  Future<CommentsAndGrades> getFeedback();

  @POST('')
  Future<void> addFeedback(@Body() final FeedbackSaveData feedbackForm);

  @GET('question/')
  Future<List<Question>> getFeedbackQuestion();
}
