import 'package:bm_mobile/core/error/failure.dart';
import 'package:bm_mobile/features/bm/domain/entity/comments_and_grades.dart';
import 'package:bm_mobile/features/bm/domain/entity/feedback.dart';
import 'package:bm_mobile/features/bm/domain/entity/question.dart';
import 'package:dartz/dartz.dart';

abstract interface class FeedbackRepository {
  Future<Either<Failure, CommentsAndGrades>> getFeedback();

  Future<Either<Failure, void>> saveFeedback(FeedbackSaveData feedbackForm);

  Future<Either<Failure, List<Question>>> getFeedbackQuestion();
}
