// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: (json['id'] as num).toInt(),
      question: json['question'] as String,
      isForCompany: json['is_for_company'] as bool,
      score: (json['score'] as num?)?.toInt() ?? 3,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'is_for_company': instance.isForCompany,
      'score': instance.score,
    };
