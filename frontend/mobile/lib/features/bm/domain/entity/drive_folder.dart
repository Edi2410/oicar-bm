import 'package:json_annotation/json_annotation.dart';

part 'generated/drive_folder.g.dart';

@JsonSerializable()
class DriveFolder {
  final int? id;
  @JsonKey(name: "folder_name")
  final String folderName;
  @JsonKey(name: "drive_link")
  final String driveLink;
  final int group;

  const DriveFolder({
    this.id,
    required this.folderName,
    required this.driveLink,
    required this.group,
  });

  factory DriveFolder.fromJson(Map<String, dynamic> json) => _$DriveFolderFromJson(json);
  Map<String, dynamic> toJson() => _$DriveFolderToJson(this);
}
