import 'package:json_annotation/json_annotation.dart';

part 'generated/tokens.g.dart';

@JsonSerializable()
class Tokens {
  final String access;
  final String refresh;

  const Tokens({
    required this.access,
    required this.refresh,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);
  Map<String, dynamic> toJson() => _$TokensToJson(this);
}
