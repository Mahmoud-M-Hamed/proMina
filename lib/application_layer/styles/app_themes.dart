import 'package:flutter/material.dart';
import 'themes/colors.dart';

class LoginTheme {
  static TextStyle get myGalleryStyle => TextStyle(
        color: ColorsTheme.kGrayColor,
        fontSize: 35,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get loginTextStyle => TextStyle(
    color: ColorsTheme.kGrayColor,
    fontWeight: FontWeight.bold,
    fontSize: 21,
  );

  static TextStyle get submitTextButtonStyle => const TextStyle(
    color: ColorsTheme.kWhiteColor,
    fontWeight: FontWeight.bold,
      );



}

class HomeTheme{
  static TextStyle get alertDialogContentStyle => TextStyle(
    fontSize: 20,
    color: ColorsTheme.kGrayColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get welcomeMinaTextStyle => TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    color: ColorsTheme.kGrayColor,
  );

  static TextStyle get logOutAndUploadTextStyle => TextStyle(
    fontWeight: FontWeight.w400,
    color: ColorsTheme.kGrayColor,
    fontSize: 17,
  );
}
