import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(final RequestOptions options, final RequestInterceptorHandler handler) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    if (token != null && token.isNotEmpty) {
      options.headers.addAll({
        HttpHeaders.authorizationHeader: 'Bearer $token',
      });
    }
    return handler.next(options);
  }
}
