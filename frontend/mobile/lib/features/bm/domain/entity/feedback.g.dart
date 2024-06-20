// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackSaveData _$FeedbackSaveDataFromJson(Map<String, dynamic> json) =>
    FeedbackSaveData(
      id: (json['id'] as num?)?.toInt(),
      feedbackFrom: (json['feedback_from'] as num?)?.toInt(),
      feedbackTo: (json['feedback_to'] as num).toInt(),
      comment: json['comment'] as String,
      isFromCompany: json['is_from_company'] as bool,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuestionForm.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedbackSaveDataToJson(FeedbackSaveData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feedback_from': instance.feedbackFrom,
      'feedback_to': instance.feedbackTo,
      'comment': instance.comment,
      'is_from_company': instance.isFromCompany,
      'questions': instance.questions,
    };
