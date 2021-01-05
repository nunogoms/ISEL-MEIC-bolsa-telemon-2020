

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemon_app/src/model/device/isensor.dart';
import 'package:telemon_app/src/view/widgets/measurements/utils/chart.dart';
import 'package:telemon_app/src/viewmodels/sensor_viewmodel.dart';

class SensorGraph extends StatefulWidget {
  final ISensor sensorDevice;

  const SensorGraph({Key key, this.sensorDevice}) : super(key: key);

  @override
  _SensorGraph createState() => _SensorGraph();
}

class _SensorGraph extends State<SensorGraph> {
  GlobalKey<ScaffoldState> _sensorKey = GlobalKey<ScaffoldState>();

  _notify(dynamic text) {
    _sensorKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          text.toString(),
        ),
        duration: Duration(
          seconds: 5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SensorViewModel sensorVM = Provider.of<SensorViewModel>(context);

    return Column(
              key: _sensorKey,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Chart(sensorVM.inputData,this.widget.sensorDevice),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Row(children: [
                        Expanded(
                          child: RaisedButton(
                            onPressed: () async {
                              bool started = await sensorVM.startMeasuring();
                             // _notify("Started: $started");
                            },
                            child: Text("Start"),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: RaisedButton(
                            onPressed: () async {
                              bool stopped = await sensorVM.resetMeasuring();
                             // _notify("Stopped: $stopped");
                            },
                            child: Text("Reset"),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ],
            );
  }
}
