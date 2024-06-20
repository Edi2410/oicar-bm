import 'package:flutter/material.dart';

const _standardTextStyle = TextStyle(fontSize: 16);
const _standardBoldTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
const _titleTextStyle = TextStyle(fontSize: 26, fontWeight: FontWeight.w900);
const _subtitleTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w900);
const _cardTitleTextStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
const _cardSubtitleTextStyle = TextStyle(fontSize: 14);
const _textInputTextStyle = TextStyle(fontSize: 14);
const _validationErrorTextStyle = TextStyle(fontSize: 12);
const _dialogOptionDescriptionTextStyle = TextStyle(fontSize: 12);
const _suffixIconTextStyle = TextStyle(fontSize: 10);
const _primaryTextButton = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);

extension CustomTextTheme on TextTheme {
  TextStyle get standard => _standardTextStyle;
  TextStyle get standardBold => _standardBoldTextStyle;
  TextStyle get title => _titleTextStyle;
  TextStyle get subtitle => _subtitleTextStyle;
  TextStyle get cardTitle => _cardTitleTextStyle;
  TextStyle get cardSubtitle => _cardSubtitleTextStyle;
  TextStyle get textInput => _textInputTextStyle;
  TextStyle get validationError => _validationErrorTextStyle;
  TextStyle get dialogOptionDescription => _dialogOptionDescriptionTextStyle;
  TextStyle get suffixIcon => _suffixIconTextStyle;
  TextStyle get primaryTextButton => _primaryTextButton;
}
