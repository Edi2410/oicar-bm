// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../question_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionForm _$QuestionFormFromJson(Map<String, dynamic> json) => QuestionForm(
      question: (json['question'] as num).toInt(),
      grade: (json['grade'] as num).toInt(),
    );

Map<String, dynamic> _$QuestionFormToJson(QuestionForm instance) => <String, dynamic>{
      'question': instance.question,
      'grade': instance.grade,
    };
