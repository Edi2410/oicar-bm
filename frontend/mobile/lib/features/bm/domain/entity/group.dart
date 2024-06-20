import 'package:json_annotation/json_annotation.dart';

part 'generated/group.g.dart';

@JsonSerializable()
class Group {
  @JsonKey(name: 'group_name')
  final String groupName;

  const Group({
    required this.groupName,
  });

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
