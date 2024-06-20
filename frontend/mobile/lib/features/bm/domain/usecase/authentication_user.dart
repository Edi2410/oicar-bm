import 'package:bm_mobile/core/error/failure.dart';
import 'package:bm_mobile/features/bm/domain/entity/auth_user.dart';
import 'package:bm_mobile/features/bm/domain/entity/tokens.dart';
import 'package:bm_mobile/features/bm/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthenticateUserUseCase {
  final AuthRepository _authRepository;

  const AuthenticateUserUseCase(this._authRepository);

  Future<Either<Failure, Tokens>> call(final AuthUser authUser) => _authRepository.loginUser(authUser);
}
