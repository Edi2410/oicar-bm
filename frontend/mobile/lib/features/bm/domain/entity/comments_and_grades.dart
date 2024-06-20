import 'package:bm_mobile/features/bm/domain/entity/grades.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comments_and_grades.g.dart';

@JsonSerializable()
class CommentsAndGrades {
  final List<List<String>> comment;
  final List<Grades> grades;

  const CommentsAndGrades({
    required this.comment,
    required this.grades,
  });

  factory CommentsAndGrades.fromJson(Map<String, dynamic> json) => _$CommentsAndGradesFromJson(json);
  Map<String, dynamic> toJson() => _$CommentsAndGradesToJson(this);
}
