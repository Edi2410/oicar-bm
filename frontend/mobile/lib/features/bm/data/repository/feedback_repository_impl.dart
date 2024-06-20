import 'package:bm_mobile/core/error/failure.dart';
import 'package:bm_mobile/features/bm/data/api/feedback_api_client.dart';
import 'package:bm_mobile/features/bm/domain/entity/auth_user.dart';
import 'package:bm_mobile/features/bm/domain/entity/comments_and_grades.dart';
import 'package:bm_mobile/features/bm/domain/entity/feedback.dart';
import 'package:bm_mobile/features/bm/domain/entity/question.dart';
import 'package:bm_mobile/features/bm/domain/repository/feedback_repository.dart';
import 'package:bm_mobile/features/login/presentation/widget/feedback_form.dart';
import 'package:dartz/dartz.dart';

class FeedbackRepositoryImpl implements FeedbackRepository {
  final FeedbackApiClient _api;

  const FeedbackRepositoryImpl(this._api);

  @override
  Future<Either<Failure, CommentsAndGrades>> getFeedback() async {
    try {
      var response = await _api.getFeedback();
      return Right(response);
    } on Exception catch (_) {
      return const Left(Failure.networkError());
    }
  }

  @override
  Future<Either<Failure, List<Question>>> getFeedbackQuestion() async {
    try {
      var response = await _api.getFeedbackQuestion();
      return Right(response);
    } on Exception catch (_) {
      return const Left(Failure.networkError());
    }
  }

  @override
  Future<Either<Failure, void>> saveFeedback(FeedbackSaveData feedbackForm) async {
    try {
      var response = await _api.addFeedback(feedbackForm);
      return Right(response);
    } on Exception catch (_) {
      return const Left(Failure.networkError());
    }
  }
}
