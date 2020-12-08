import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telemon_app/config/app_config.dart';
import 'package:telemon_app/src/views/MeasurementsView.dart';


void main() {
  runApp(MaterialApp(
    title: APP_NAME,
    initialRoute: Routes.MEASUREMENTS_PAGE,
    routes: {
      //Routes.HOME_PAGE: (context)  => {}, TODO : SINCE RN MEASUREMENTS PAGE IS THE FIRST ONE
      // Routes.DEVICE_PAGE:(context) => {},
      Routes.MEASUREMENTS_PAGE:(context) => MeasurementsView(),
      //Routes.ECG_PAGE:(context) => {}
    },

  ));
}