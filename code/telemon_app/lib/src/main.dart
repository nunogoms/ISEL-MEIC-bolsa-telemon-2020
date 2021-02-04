import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:telemon_app/config/app_config.dart';
import 'package:telemon_app/src/data/model/device/sensors/acc_sensor_data.dart';
import 'package:telemon_app/src/data/model/device/sensors/ecg_sensor_data.dart';
import 'package:telemon_app/src/data/model/device/sensors/eda_sensor_data.dart';
import 'package:telemon_app/src/data/model/device/sensors/eeg_sensor_data.dart';
import 'package:telemon_app/src/data/model/device/sensors/emg_sensor_data.dart';
import 'package:telemon_app/src/ui/view/views/connection/bluetooth_search_page.dart';
import 'package:telemon_app/src/ui/view/views/measurements/generic_view.dart';
import 'package:telemon_app/src/ui/view/views/menu/fragments/wip_page.dart';
import 'package:telemon_app/src/ui/view/views/menu/menu_view.dart';
import 'package:telemon_app/src/ui/viewmodels/settings_viewmodel.dart';

import 'consts/theme/theme.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SettingsViewModel()),
      ],
      child: MaterialApp(
        title: APP_NAME,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('pt', ''),
          const Locale('en', ''),
        ],
        theme: mainTheme(),
        initialRoute: Routes.MENU_PAGE,
        routes: {
          Routes.MENU_PAGE: (context) => MenuView(),
          //Bluetooth Device Search
          Routes.DEVICE_SEARCH_PAGE: (context) => BluetoothSearch(),
          //SENSORS
          Routes.SCALE_PAGE: (context) => WipPage(),
          Routes.EMG_PAGE: (context) => GenericView(EmgSensorData()),
          Routes.ECG_PAGE: (context) => GenericView(EcgSensorData()),
          Routes.EDA_PAGE: (context) => GenericView(EdaSensorData()),
          Routes.EEG_PAGE: (context) => GenericView(EegSensorData()),
          Routes.ACC_PAGE: (context) => GenericView(AccSensorData())
        },
      )));
}
