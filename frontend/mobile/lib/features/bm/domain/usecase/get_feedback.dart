import 'package:bm_mobile/core/error/failure.dart';
import 'package:bm_mobile/features/bm/domain/entity/comments_and_grades.dart';
import 'package:bm_mobile/features/bm/domain/repository/feedback_repository.dart';
import 'package:dartz/dartz.dart';

class GetFeedbackUseState {
  final FeedbackRepository _feedbackRepository;

  const GetFeedbackUseState(this._feedbackRepository);

  Future<Either<Failure, CommentsAndGrades>> getFeedback() => _feedbackRepository.getFeedback();
}
