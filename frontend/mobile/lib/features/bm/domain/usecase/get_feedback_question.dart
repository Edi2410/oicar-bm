import 'package:bm_mobile/core/error/failure.dart';
import 'package:bm_mobile/features/bm/domain/entity/question.dart';
import 'package:bm_mobile/features/bm/domain/repository/feedback_repository.dart';
import 'package:dartz/dartz.dart';

class GetFeedbackQuestionUseCase {
  final FeedbackRepository _feedbackRepository;

  const GetFeedbackQuestionUseCase(this._feedbackRepository);

  Future<Either<Failure, List<Question>>> getFeedbackQuestion() => _feedbackRepository.getFeedbackQuestion();
}
