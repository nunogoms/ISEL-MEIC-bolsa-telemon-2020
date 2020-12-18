import 'package:bitalino/bitalino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telemon_app/src/model/device/device.dart';

import '../../../../chart.dart';

class EcgPage extends StatefulWidget {
  @override
  _EcgPageState createState() => _EcgPageState();
}

class _EcgPageState extends State<EcgPage> {
  GlobalKey<ScaffoldState> _ecgKey = GlobalKey<ScaffoldState>();
  final bitalinoDevice = DeviceController();
  int sequence = 0;
  List<SensorValue> data = [];
  DateTime previousTime;
  TextEditingController controller = TextEditingController();

  final int samplesNum = 200;

  _notify(dynamic text) {
    _ecgKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          text.toString(),
        ),
        duration: Duration(
          seconds: 1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _ecgKey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Row(children: [
                    Expanded(
                      child: RaisedButton(
                        onPressed: () async {
                          previousTime = DateTime.now();
                          bool started =
                              await bitalinoDevice.getController().start(
                            [
                              0,
                            ],
                            Frequency.HZ10,
                            numberOfSamples: samplesNum,
                            onDataAvailable: (frame) {
                              if (data.length >= samplesNum) data.removeAt(0);
                              setState(() {
                                data.add(SensorValue(
                                    previousTime, frame.analog[0].toDouble()));
                                previousTime =
                                    DateTime.fromMillisecondsSinceEpoch(
                                        previousTime.millisecondsSinceEpoch +
                                            1000 ~/ 10);
                              });
                            },
                          );
                          _notify("Started: $started");
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
                          bool stopped =
                              await bitalinoDevice.getController().stop();
                          _notify("Stopped: $stopped");
                        },
                        child: Text("Stop"),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Chart(data),
              ),
            )
          ],
        ));
  }
}
