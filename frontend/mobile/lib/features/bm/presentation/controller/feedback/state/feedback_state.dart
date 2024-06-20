import 'package:bm_mobile/features/bm/domain/entity/comments_and_grades.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_state.freezed.dart';

@freezed
class FeedbackState with _$FeedbackState {
  const factory FeedbackState.loading() = _Loading;
  const factory FeedbackState.empty() = _Empty;
  const factory FeedbackState.success(CommentsAndGrades commentsAndGrades) = _Success;
  const factory FeedbackState.error() = _Error;
}
