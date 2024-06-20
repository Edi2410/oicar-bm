import 'package:json_annotation/json_annotation.dart';

part 'grades.g.dart';

@JsonSerializable()
class Grades {
  final double grade;
  final String question;

  const Grades({
    required this.grade,
    required this.question,
  });

  factory Grades.fromJson(Map<String, dynamic> json) => _$GradesFromJson(json);
  Map<String, dynamic> toJson() => _$GradesToJson(this);
}
