import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:telemon_app/config/app_config.dart';
import 'package:telemon_app/src/theme/theme.dart';
import 'package:telemon_app/src/ui/view/pages/measurements/acc_view.dart';
import 'package:telemon_app/src/ui/view/pages/measurements/ecg_view.dart';
import 'package:telemon_app/src/ui/view/pages/measurements/eda_view.dart';
import 'package:telemon_app/src/ui/view/pages/measurements/eeg_view.dart';
import 'package:telemon_app/src/ui/view/pages/measurements/emg_view.dart';
import 'package:telemon_app/src/ui/view/pages/menu_view.dart';
import 'package:telemon_app/src/ui/viewmodels/settings_viewmodel.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SettingsViewModel()),
      ],
      child: MaterialApp(
        title: APP_NAME,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: [const Locale('pt', '')],
        theme: mainTheme(),
        initialRoute: Routes.MENU_PAGE,
        routes: {
          Routes.MENU_PAGE: (context) => MenuView(),
          //SENSORS
          Routes.EMG_PAGE: (context) => EmgView(),
          Routes.ECG_PAGE: (context) => EcgView(),
          Routes.EDA_PAGE: (context) => EdaView(),
          Routes.EEG_PAGE: (context) => EegView(),
          Routes.ACC_PAGE: (context) => AccView()
        },
      )));
}
