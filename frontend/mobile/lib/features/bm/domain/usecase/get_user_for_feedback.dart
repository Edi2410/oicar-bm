import 'package:bm_mobile/core/error/failure.dart';
import 'package:bm_mobile/features/bm/domain/entity/user_data.dart';
import 'package:bm_mobile/features/bm/domain/repository/users_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserForFeedbackUseCase {
  final UsersRepository _usersRepository;

  const GetUserForFeedbackUseCase(this._usersRepository);

  Future<Either<Failure, List<UserData>>> getUserForFeedback() => _usersRepository.getUserForFeedback();
}
