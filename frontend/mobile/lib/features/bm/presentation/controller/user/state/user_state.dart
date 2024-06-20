import 'package:bm_mobile/features/bm/domain/entity/user_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.loading() = _Loading;
  const factory UserState.empty() = _Empty;
  const factory UserState.success(UserData userData) = _Success;
  const factory UserState.error() = _Error;
}
