import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemon_app/src/ui/view/views/measurements/measurements_list/measurement_visual_info.dart';
import 'package:telemon_app/src/ui/view/views/measurements/measuring/generic_view.dart';
import 'package:telemon_app/src/ui/viewmodels/settings_viewmodel.dart';

import 'measurements_button.dart';

class MeasurementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingsViewModel settingsViewModel =
        Provider.of<SettingsViewModel>(context);

    return Container(
      //TODO add theme.spacing
      child: Column(children: <Widget>[
        ...settingsViewModel.deviceSetting.currDeviceConfiguration.sensors.map(
          (sensor) {
            MeasurementVisualInfo? mvi = measurementsVisualInfoMap[sensor.name];
            if (mvi == null) return Container();
            return MeasurementsButton(
                mvi.measurementName(context),
                mvi.buttonColor,
                (_) => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GenericView(sensor, mvi.measurementName(context)))));
          },
        )
      ]),
    );
  }
}
