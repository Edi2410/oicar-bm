import 'package:bm_mobile/core/error/failure.dart';
import 'package:bm_mobile/features/bm/domain/entity/user_data.dart';
import 'package:bm_mobile/features/bm/domain/repository/users_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserDataUseCase {
  final UsersRepository _usersRepository;

  const GetUserDataUseCase(this._usersRepository);

  Future<Either<Failure, UserData>> getUser() => _usersRepository.getUser();
}
