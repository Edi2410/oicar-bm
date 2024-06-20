// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../drive_folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriveFolder _$DriveFolderFromJson(Map<String, dynamic> json) => DriveFolder(
      id: json['id'] as int?,
      folderName: json['folder_name'] as String,
      driveLink: json['drive_link'] as String,
      group: json['group'] as int,
    );

Map<String, dynamic> _$DriveFolderToJson(DriveFolder instance) => <String, dynamic>{
      'id': instance.id,
      'folder_name': instance.folderName,
      'drive_link': instance.driveLink,
      'group': instance.group,
    };
