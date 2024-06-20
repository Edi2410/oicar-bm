import 'package:json_annotation/json_annotation.dart';

part 'generated/question_form.g.dart';

@JsonSerializable()
class QuestionForm {
  final int question;
  final int grade;

  const QuestionForm({
    required this.question,
    required this.grade,
  });

  factory QuestionForm.fromJson(Map<String, dynamic> json) => _$QuestionFormFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionFormToJson(this);
}
