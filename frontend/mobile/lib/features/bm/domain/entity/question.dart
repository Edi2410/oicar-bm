import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  final int id;
  final String question;
  @JsonKey(name: 'is_for_company')
  final bool isForCompany;
  int? score;

  Question({
    required this.id,
    required this.question,
    required this.isForCompany,
    this.score = 3,
  });

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
