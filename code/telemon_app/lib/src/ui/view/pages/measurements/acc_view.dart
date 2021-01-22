import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemon_app/src/data/model/device/sensors/acc_sensor_data.dart';
import 'package:telemon_app/src/ui/view/widgets/appbars/back_title_appbar.dart';
import 'package:telemon_app/src/ui/view/widgets/measurements/sensor_graph.dart';
import 'package:telemon_app/src/ui/viewmodels/exam_viewmodel.dart';
import 'package:telemon_app/src/ui/viewmodels/settings_viewmodel.dart';

class AccView extends StatelessWidget {
  var currSensor = AccSensorData();

  @override
  Widget build(BuildContext context) {
    var settingsViewModel = Provider.of<SettingsViewModel>(context);//TODO change this
    return Scaffold(
        appBar: BackTitleAppbar("Análise de Aceleração").build(context),
        body: ChangeNotifierProvider(
          create: (context) => ExamViewModel(currSensor,settingsViewModel),//TODO change this viewModel to another ViewModel
          child: SensorGraph(sensorDevice: currSensor),
        ));
  }
}
