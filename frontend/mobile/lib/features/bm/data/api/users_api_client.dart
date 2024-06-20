import 'package:bm_mobile/features/bm/domain/entity/auth_user.dart';
import 'package:bm_mobile/features/bm/domain/entity/tokens.dart';
import 'package:bm_mobile/features/bm/domain/entity/user_data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'users_api_client.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:8000/api/users/')
abstract class UsersApiClient {
  factory UsersApiClient(Dio dio, {String baseUrl}) = _UsersApiClient;

  @GET('user/')
  Future<UserData> getUser();

  @POST('invite/')
  Future<void> inviteUser(@Body() final UserData user);

  @GET('user/for-feedback/')
  Future<List<UserData>> getUserForFeedback();
}
