//Light pallet

import 'package:flutter/material.dart';

const backgroundColorLight = Color(0xFF861949);
const backgroundCardColorLight = Color(0xFFFFFFFF);
const shadowColorLight = Color(0xFF333333);
const textColorLight = Color(0xFF861949);
const secondaryTextColorLight = Color(0xFF000000);
const primaryColorLight = Color(0xFF861949);
const grayColorLight = Color(0xFF333333);
const errorColorLight = Color(0xFFE72C2C);
const borderColorLight = Color(0xFF861949);
//Dark pallet

const backgroundColorDark = Color(0xFF861949);
const backgroundCardColorDark = Color(0xFF000000);
const shadowColorDark = Color(0xFF333333);
const textColorDark = Color(0xFF861949);
const secondaryTextColorDark = Color(0xFFFFFFFF);
const primaryColorDark = Color(0xFF861949);
const grayColorDark = Color(0xFF333333);
const errorColorDark = Color(0xFFE72C2C);
const borderColorDark = Color(0xFF861949);

class AppColors extends ThemeExtension<AppColors> {
  final Color? text;
  final Color? secondaryText;
  final Color? primary;
  final Color? gray;
  final Color? error;
  final Color? background;
  final Color? backgroundCard;
  final Color? borderColor;
  final Color? shadowColor;

  const AppColors({
    required this.text,
    required this.secondaryText,
    required this.primary,
    required this.gray,
    required this.error,
    required this.background,
    required this.backgroundCard,
    required this.borderColor,
    required this.shadowColor,
  });

  @override
  AppColors copyWith({
    final Color? text,
    final Color? secondaryText,
    final Color? primary,
    final Color? gray,
    final Color? error,
    final Color? background,
    final Color? backgroundCard,
    final Color? borderColor,
    final Color? shadowColor,
  }) =>
      AppColors(
        text: text ?? this.text,
        secondaryText: secondaryText ?? this.secondaryText,
        primary: primary ?? this.primary,
        gray: gray ?? this.gray,
        error: error ?? this.error,
        background: background ?? this.background,
        backgroundCard: backgroundCard ?? this.backgroundCard,
        borderColor: borderColor ?? this.borderColor,
        shadowColor: shadowColor ?? this.shadowColor,
      );

  @override
  ThemeExtension<AppColors> lerp(covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      text: Color.lerp(text, other.text, t),
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t),
      primary: Color.lerp(primary, other.primary, t),
      gray: Color.lerp(gray, other.gray, t),
      error: Color.lerp(error, other.error, t),
      background: Color.lerp(background, other.background, t),
      backgroundCard: Color.lerp(backgroundCard, other.backgroundCard, t),
      borderColor: Color.lerp(borderColor, other.borderColor, t),
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t),
    );
  }
}
