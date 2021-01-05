
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemon_app/src/model/device/sensors/eeg_sensor_data.dart';
import 'package:telemon_app/src/view/widgets/appbars/back_title_appbar.dart';
import 'package:telemon_app/src/view/widgets/measurements/sensor_graph.dart';
import 'package:telemon_app/src/viewmodels/sensor_viewmodel.dart';

class EegView extends StatelessWidget {
  var currSensor = EegSensorData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackTitleAppbar("Electroencefalograma").build(context),
        body: ChangeNotifierProvider(
          create: (context) => SensorViewModel(currSensor),
          child: SensorGraph(sensorDevice: currSensor),
        ));
  }
}
