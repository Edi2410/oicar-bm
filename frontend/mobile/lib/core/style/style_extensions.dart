import 'package:bm_mobile/core/style/colors.dart';
import 'package:bm_mobile/core/style/text_style.dart';
import 'package:flutter/material.dart';

extension StyleContextExtension on BuildContext {
  TextStyle get standardText => Theme.of(this).textTheme.standard;
  TextStyle get standardBoldText => Theme.of(this).textTheme.standardBold;
  TextStyle get titleText => Theme.of(this).textTheme.title;
  TextStyle get subtitleText => Theme.of(this).textTheme.subtitle;
  TextStyle get cardTitleText => Theme.of(this).textTheme.cardTitle;
  TextStyle get cardSubtitleText => Theme.of(this).textTheme.cardSubtitle;
  TextStyle get validationErrorText => Theme.of(this).textTheme.validationError;
  TextStyle get dialogOptionDescriptionText => Theme.of(this).textTheme.dialogOptionDescription;
  TextStyle get suffixIconText => Theme.of(this).textTheme.suffixIcon;
  TextStyle get primaryTextButton => Theme.of(this).textTheme.primaryTextButton;

  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get primaryColor => Theme.of(this).extension<AppColors>()!.primary!;
  Color get textColor => Theme.of(this).extension<AppColors>()!.text!;
  Color get secondaryTextColor => Theme.of(this).extension<AppColors>()!.secondaryText!;
  Color get errorColor => Theme.of(this).extension<AppColors>()!.error!;
  Color get shadowColor => Theme.of(this).shadowColor;
  Color get cardBackgroundColor => Theme.of(this).extension<AppColors>()!.backgroundCard!;
  Color get borderColor => Theme.of(this).extension<AppColors>()!.borderColor!;
  Color get grayColor => Theme.of(this).extension<AppColors>()!.gray!;
}
