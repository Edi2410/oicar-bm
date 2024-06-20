import 'package:bm_mobile/core/error/failure.dart';
import 'package:bm_mobile/features/bm/domain/entity/feedback.dart';
import 'package:bm_mobile/features/bm/domain/repository/feedback_repository.dart';
import 'package:dartz/dartz.dart';

class SaveFeedbackUseCase {
  final FeedbackRepository _feedbackRepository;

  const SaveFeedbackUseCase(this._feedbackRepository);

  Future<Either<Failure, void>> saveFeedback(FeedbackSaveData feedbackForm) =>
      _feedbackRepository.saveFeedback(feedbackForm);
}
