import 'package:bm_mobile/core/route_generator.dart';
import 'package:bm_mobile/core/style/colors.dart';
import 'package:bm_mobile/core/style/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Business Matchmaker",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme.copyWith(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: "Giacomo",
              bodyColor: textColorLight,
              displayColor: textColorLight,
            ),
      ),
      initialRoute: RouteGenerator.splashScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      locale: const Locale('hr'),
    );
  }
}
