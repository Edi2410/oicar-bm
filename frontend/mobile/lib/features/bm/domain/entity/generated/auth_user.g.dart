// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUser _$AuthUserFromJson(Map<String, dynamic> json) => AuthUser(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthUserToJson(AuthUser instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
