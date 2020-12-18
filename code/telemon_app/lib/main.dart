import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:telemon_app/config/app_config.dart';
import 'package:telemon_app/src/theme/theme.dart';
import 'package:telemon_app/src/views/MenuView.dart';


void main() {

  runApp(
    MaterialApp(
    title: APP_NAME,
    localizationsDelegates: GlobalMaterialLocalizations.delegates,
    supportedLocales: [
      const Locale('pt', '')
    ],
    theme: mainTheme(),
    initialRoute: Routes.MENU_PAGE,
    routes: {
      //Routes.HOME_PAGE: (context)  => {}, TODO : SINCE RN MEASUREMENTS PAGE IS THE FIRST ONE
      //Routes.DEVICE_PAGE:(context) => DeviceView(),
      //Routes.MEASUREMENTS_PAGE: (context) => MeasurementsView(),
     //Routes.ECG_PAGE:(context) => EcgView(),
      Routes.MENU_PAGE :(context) => MenuView()
    },

  ));
}