// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      folders:
          (json['folder_id'] as List<dynamic>?)?.map((e) => DriveFolder.fromJson(e as Map<String, dynamic>)).toList(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      group: json['group'] == null ? null : Group.fromJson(json['group'] as Map<String, dynamic>),
      isAdmin: json['is_admin'] as bool,
      isCompany: json['is_company'] as bool,
      isStudent: json['is_student'] as bool,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'folder_id': instance.folders?.map((e) => e.toJson()).toList(),
      'user': instance.user.toJson(),
      'group': instance.group?.toJson(),
      'is_admin': instance.isAdmin,
      'is_company': instance.isCompany,
      'is_student': instance.isStudent,
    };
