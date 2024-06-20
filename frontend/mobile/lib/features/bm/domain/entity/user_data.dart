import 'package:bm_mobile/features/bm/domain/entity/drive_folder.dart';
import 'package:bm_mobile/features/bm/domain/entity/group.dart';
import 'package:bm_mobile/features/bm/domain/entity/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_data.g.dart';

@JsonSerializable(explicitToJson: true)
class UserData {
  @JsonKey(name: 'folder_id')
  final List<DriveFolder>? folders;
  final User user;
  final Group? group;
  @JsonKey(name: 'is_admin')
  final bool isAdmin;
  @JsonKey(name: 'is_company')
  final bool isCompany;
  @JsonKey(name: 'is_student')
  final bool isStudent;

  const UserData({
    required this.folders,
    required this.user,
    required this.group,
    required this.isAdmin,
    required this.isCompany,
    required this.isStudent,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
