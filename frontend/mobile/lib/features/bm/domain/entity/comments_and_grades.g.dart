// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_and_grades.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentsAndGrades _$CommentsAndGradesFromJson(Map<String, dynamic> json) =>
    CommentsAndGrades(
      comment: (json['comment'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
      grades: (json['grades'] as List<dynamic>)
          .map((e) => Grades.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentsAndGradesToJson(CommentsAndGrades instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'grades': instance.grades,
    };
