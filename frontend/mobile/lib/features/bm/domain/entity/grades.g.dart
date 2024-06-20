// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grades.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Grades _$GradesFromJson(Map<String, dynamic> json) => Grades(
      grade: (json['grade'] as num).toDouble(),
      question: json['question'] as String,
    );

Map<String, dynamic> _$GradesToJson(Grades instance) => <String, dynamic>{
      'grade': instance.grade,
      'question': instance.question,
    };
