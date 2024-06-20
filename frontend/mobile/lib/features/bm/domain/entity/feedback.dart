import 'package:bm_mobile/features/bm/domain/entity/question_form.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feedback.g.dart';

@JsonSerializable()
class FeedbackSaveData {
  final int? id;
  @JsonKey(name: 'feedback_from')
  final int? feedbackFrom;
  @JsonKey(name: 'feedback_to')
  final int feedbackTo;
  final String comment;
  @JsonKey(name: 'is_from_company')
  final bool isFromCompany;
  final List<QuestionForm> questions;

  const FeedbackSaveData({
    this.id,
    this.feedbackFrom,
    required this.feedbackTo,
    required this.comment,
    required this.isFromCompany,
    required this.questions,
  });

  factory FeedbackSaveData.fromJson(Map<String, dynamic> json) => _$FeedbackSaveDataFromJson(json);
  Map<String, dynamic> toJson() => _$FeedbackSaveDataToJson(this);
}
