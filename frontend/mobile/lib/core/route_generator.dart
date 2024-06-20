import 'package:bm_mobile/features/login/presentation/screen/feedback_screen.dart';
import 'package:bm_mobile/features/login/presentation/screen/homescreen.dart';
import 'package:bm_mobile/features/login/presentation/screen/login_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String splashScreen = '/';
  static const String homeScreen = '/homescreen';

  const RouteGenerator._();

  static Route<dynamic> generateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        throw FormatException("Route ${settings.name} not found...");
    }
  }
}
