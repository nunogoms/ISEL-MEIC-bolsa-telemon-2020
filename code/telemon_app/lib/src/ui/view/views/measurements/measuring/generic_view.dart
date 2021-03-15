import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemon_app/src/data/model/device/configurations/sensor_module.dart';
import 'package:telemon_app/src/data/model/device/sensors/isensor.dart';
import 'package:telemon_app/src/data/model/device/sensors/sensor_name.dart';
import 'package:telemon_app/src/ui/view/views/measurements/measuring/sensor_graph.dart';
import 'package:telemon_app/src/ui/view/widgets/appbars/back_title_appbar.dart';
import 'package:telemon_app/src/ui/viewmodels/measurement_viewmodel.dart';
import 'package:telemon_app/src/ui/viewmodels/settings_viewmodel.dart';


class GenericView extends StatelessWidget {
  final SensorModule _currSensorModule;
  final String _title;

  GenericView(this._currSensorModule, this._title);

  @override
  Widget build(BuildContext context) {
    SettingsViewModel settingsViewModel = Provider.of<SettingsViewModel>(context);
    return Scaffold(
        appBar: BackTitleAppbar(_title),
        body: ChangeNotifierProvider(
          create: (_) => MeasurementViewModel(_currSensorModule, settingsViewModel.getExamSettings()),
          child: SensorGraph(sensorDevice: _currSensorModule.sensor, key: UniqueKey(),),
        ));
  }
}
