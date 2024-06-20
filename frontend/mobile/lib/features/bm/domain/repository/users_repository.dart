import 'package:bm_mobile/core/error/failure.dart';
import 'package:bm_mobile/features/bm/domain/entity/auth_user.dart';
import 'package:bm_mobile/features/bm/domain/entity/tokens.dart';
import 'package:bm_mobile/features/bm/domain/entity/user_data.dart';
import 'package:dartz/dartz.dart';

abstract interface class UsersRepository {
  Future<Either<Failure, UserData>> getUser();

  Future<Either<Failure, void>> inviteUser(UserData user);

  Future<Either<Failure, List<UserData>>> getUserForFeedback();
}
