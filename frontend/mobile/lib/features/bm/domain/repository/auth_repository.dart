import 'package:bm_mobile/core/error/failure.dart';
import 'package:bm_mobile/features/bm/domain/entity/auth_user.dart';
import 'package:bm_mobile/features/bm/domain/entity/tokens.dart';
import 'package:dartz/dartz.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, Tokens>> loginUser(AuthUser authUser);
}
