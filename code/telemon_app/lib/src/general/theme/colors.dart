import 'package:flutter/material.dart';

// ignore_for_file: non_constant_identifier_names

class ThemeColors {
  static TextColors text = TextColors();
  static ThemeCols theme = ThemeCols();
  static MiscColors misc = MiscColors();
}

@protected
class TextColors {
  final Color BLACK = Color(0xff000000);
  final Color DARK_GREY = Color(0xff4F4F4F);
  final Color GREY = Color(0xffBDBDBD);

  final Color LIGHT_GREY = Color(0xffE0E0E0);
  final Color WHITE = Color(0xffffffff);
}

@protected
class ThemeCols {
  final Color PRIMARY_WHITE = Color(0xffffffff);
  final Color SECONDARY_GREY = Color(0xffD0D3DA);
  final Color BLACK = Color(0xff000000);

  final Color HEALTH_RED = Color(0xffF34D3E);
  final Color HEALTH_GREEN = Color(0xff4C9F38);
  final Color HEALTH_BLUE = Color(0xff5DAEEC);

  final Color GOOD_GREEN = Color(0xff27AE60);
  final Color WARNING_YELLOW = Color(0xffFDFD66);
  final Color ERROR_RED = Color(0xffB03D33);
  final Color NAVBAR_BLUE = Color(0xff5DAEEC);
  final Color INFO_BLUE = Color(0xff5DAEEC);
}

@protected
class MiscColors {
  final Color BUTTON_BLUE = Color(0xff007BFF);
  final Color LIGHT_GREY = Color(0xffD0D3DA);

  final Color MEASUREMENTS_SCALE = Color(0xffB19CD9);
  final Color MEASUREMENTS_ECG = Color(0xffF34D3E);
  final Color MEASUREMENTS_EEG = Color(0xffFFB347);
  final Color MEASUREMENTS_EMG = Color(0xff77DD77);
  final Color MEASUREMENTS_EDG = Color(0xff88AED0);
  final Color MEASUREMENTS_OTHER = Color(0xffFDFD66); //todo CHANGE THIS COLOR
}
