import 'package:bm_mobile/core/error/failure.dart';
import 'package:bm_mobile/features/bm/data/api/auth_api_client.dart';
import 'package:bm_mobile/features/bm/domain/entity/auth_user.dart';
import 'package:bm_mobile/features/bm/domain/entity/tokens.dart';
import 'package:bm_mobile/features/bm/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiClient _api;

  const AuthRepositoryImpl(this._api);

  @override
  Future<Either<Failure, Tokens>> loginUser(AuthUser authUser) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var response = await _api.login(authUser);

      await prefs.setString('access_token', response.access);
      await prefs.setString('refresh_token', response.refresh);

      return Right(response);
    } on Exception catch (_) {
      await prefs.remove('access_token');
      await prefs.remove('refresh_token');

      return const Left(Failure.networkError());
    }
  }
}
