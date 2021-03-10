import 'package:flutter/material.dart';
import 'colors.dart';
import 'fonts.dart';

ThemeData mainTheme(){
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _mainTextTheme(base.textTheme),
    primaryColor: ThemeColors.theme.NAVBAR_BLUE,
    backgroundColor: ThemeColors.theme.SECONDARY_GREY,
    buttonColor: ThemeColors.misc.BUTTON_BLUE,
    errorColor: ThemeColors.theme.ERROR_RED,
    bottomAppBarColor: ThemeColors.theme.NAVBAR_BLUE,
  );

}

@protected
TextTheme _mainTextTheme(TextTheme base) {
  return base.copyWith(
    headline1: base.headline1!.copyWith(
      fontFamily: CustomFont.H1.fontFamily,
      fontSize: CustomFont.H1.fontSize,
    ),
    headline2: base.headline2!.copyWith(
      fontFamily: CustomFont.H2.fontFamily,
      fontSize: CustomFont.H2.fontSize,
    ),
    headline3: base.headline3!.copyWith(
      fontFamily: CustomFont.H3.fontFamily,
      fontSize: CustomFont.H3.fontSize,
    ),
    headline4: base.headline4!.copyWith(
      fontFamily: CustomFont.H4.fontFamily,
      fontSize: CustomFont.H4.fontSize,
    ),
    bodyText1: base.bodyText1!.copyWith(
      fontFamily: CustomFont.TEXT.fontFamily,
      fontSize: CustomFont.TEXT.fontSize,
    ),
    button: base.button!.copyWith(
      fontFamily: CustomFont.SMALL_BUTTON.fontFamily,
      fontSize: CustomFont.SMALL_BUTTON.fontSize,
    ),
    /**
     * It is the same as TITLE
     */
    headline6: base.headline6!.copyWith(
      fontFamily: CustomFont.TITLE.fontFamily,
      fontSize: CustomFont.TITLE.fontSize,
    ),
    /**
     * It is the same as HEADLINE
     */
    headline5: base.headline5!.copyWith(
      fontFamily: CustomFont.HEADLINE.fontFamily,
      fontSize: CustomFont.HEADLINE.fontSize,
    ),
    /**
     * INPUT BOX
     */
    subtitle1: base.subtitle1!.copyWith(
      fontFamily: CustomFont.INPUT_BOX.fontFamily,
      fontSize: CustomFont.INPUT_BOX.fontSize,
    ),
  );
}
