import 'package:json_annotation/json_annotation.dart';

part 'generated/auth_user.g.dart';

@JsonSerializable()
class AuthUser {
  final String username;
  final String password;

  const AuthUser({
    required this.username,
    required this.password,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) => _$AuthUserFromJson(json);
  Map<String, dynamic> toJson() => _$AuthUserToJson(this);
}
