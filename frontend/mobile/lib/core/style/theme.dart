import 'package:bm_mobile/core/style/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    fontFamily: "Giacomo",
    scaffoldBackgroundColor: backgroundColorLight,
    shadowColor: shadowColorLight,
    extensions: const [
      AppColors(
        text: textColorLight,
        secondaryText: secondaryTextColorLight,
        primary: primaryColorLight,
        gray: grayColorLight,
        error: errorColorLight,
        background: backgroundColorLight,
        backgroundCard: backgroundCardColorLight,
        borderColor: borderColorLight,
        shadowColor: shadowColorLight,
      )
    ],
  );
}
