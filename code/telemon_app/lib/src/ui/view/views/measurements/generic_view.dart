import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemon_app/src/data/model/device/isensor.dart';
import 'package:telemon_app/src/ui/view/views/measurements/sensor_graph.dart';
import 'package:telemon_app/src/ui/view/widgets/appbars/back_title_appbar.dart';
import 'package:telemon_app/src/ui/viewmodels/exam_viewmodel.dart';
import 'package:telemon_app/src/ui/viewmodels/settings_viewmodel.dart';

class GenericViewArgs {
  final String title;

  GenericViewArgs(this.title);
}

class GenericView<T extends ISensor> extends StatelessWidget {
  T _currSensor;

  GenericView(this._currSensor);

  @override
  Widget build(BuildContext context) {
    final GenericViewArgs args = ModalRoute.of(context).settings.arguments;
    var settingsViewModel = Provider.of<SettingsViewModel>(context);

    return Scaffold(
        appBar: BackTitleAppbar(args.title).build(context),
        body: ChangeNotifierProvider(
          create: (context) => ExamViewModel(_currSensor, settingsViewModel.examSettings),
          child: SensorGraph(sensorDevice: _currSensor),
        ));
  }
}
