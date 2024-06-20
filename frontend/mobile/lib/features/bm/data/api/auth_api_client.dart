import 'package:bm_mobile/features/bm/domain/entity/auth_user.dart';
import 'package:bm_mobile/features/bm/domain/entity/tokens.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_client.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:8000/api/auth/')
abstract class AuthApiClient {
  factory AuthApiClient(Dio dio, {String baseUrl}) = _AuthApiClient;

  @POST('')
  Future<Tokens> login(@Body() final AuthUser authUser);
}
