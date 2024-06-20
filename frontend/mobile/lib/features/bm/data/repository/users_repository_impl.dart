import 'package:bm_mobile/core/error/failure.dart';
import 'package:bm_mobile/features/bm/data/api/feedback_api_client.dart';
import 'package:bm_mobile/features/bm/data/api/users_api_client.dart';
import 'package:bm_mobile/features/bm/domain/entity/auth_user.dart';
import 'package:bm_mobile/features/bm/domain/entity/tokens.dart';
import 'package:bm_mobile/features/bm/domain/entity/user_data.dart';
import 'package:bm_mobile/features/bm/domain/repository/feedback_repository.dart';
import 'package:bm_mobile/features/bm/domain/repository/users_repository.dart';
import 'package:dartz/dartz.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersApiClient _api;

  const UsersRepositoryImpl(this._api);

  @override
  Future<Either<Failure, UserData>> getUser() async {
    try {
      var response = await _api.getUser();
      return Right(response);
    } on Exception catch (_) {
      return const Left(Failure.networkError());
    }
  }

  @override
  Future<Either<Failure, List<UserData>>> getUserForFeedback() async {
    try {
      var response = await _api.getUserForFeedback();
      return Right(response);
    } on Exception catch (_) {
      return const Left(Failure.networkError());
    }
  }

  @override
  Future<Either<Failure, void>> inviteUser(UserData user) async {
    try {
      await _api.inviteUser(user);
      return const Right(null);
    } on Exception catch (_) {
      return const Left(Failure.networkError());
    }
  }
}
