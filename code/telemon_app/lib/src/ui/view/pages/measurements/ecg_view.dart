import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemon_app/src/data/model/device/sensors/ecg_sensor_data.dart';
import 'package:telemon_app/src/ui/view/widgets/appbars/back_title_appbar.dart';
import 'package:telemon_app/src/ui/view/widgets/measurements/sensor_graph.dart';
import 'package:telemon_app/src/ui/viewmodels/sensor_viewmodel.dart';

class EcgView extends StatelessWidget {
  var currSensor = EcgSensorData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackTitleAppbar("Electrocardiografia").build(context),
        body: ChangeNotifierProvider(
          create: (context) => SensorViewModel(currSensor),
          child: SensorGraph(sensorDevice: currSensor),
        ));
  }
}
