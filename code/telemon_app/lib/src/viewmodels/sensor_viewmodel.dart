import 'package:flutter/cupertino.dart';
import 'package:telemon_app/src/model/device/isensor.dart';
import 'package:telemon_app/src/services/bitalino_controller.dart';
import 'package:telemon_app/src/viewmodels/settings_viewmodel.dart';

final int numOfSamples = 200;

class SensorViewModel extends ChangeNotifier {
  final ISensor sensor;
  List<SensorValue> inputData = List<SensorValue>();

  static BitalinoController _deviceController = BitalinoController();

  SensorViewModel(this.sensor);

  Future<bool> startMeasuring() async {
    var previousTime = DateTime.now();
    bool started = false;
    try {
      started = await _deviceController.startAcquisition(sensor.getSensorCode(),
          SettingsViewModel.sampleFrequency, numOfSamples, (frame) {
        if(inputData.length >= numOfSamples) inputData.removeAt(0);
        inputData.insert(inputData.length,SensorValue(
            previousTime,
            sensor.normalizeValue(
                frame.analog[sensor.getSensorCode().index].toDouble())));
        previousTime = DateTime.fromMillisecondsSinceEpoch(
            previousTime.millisecondsSinceEpoch + 1000 ~/ 10);
        notifyListeners();
      });
    } on Exception catch (Exception) {
      print(Exception); //TODO deal wit exceptions
    }
    notifyListeners();
    return started;
  }

  Future<bool> stopMeasuring() async {
    return await _deviceController.stopAcquisition().whenComplete(() => notifyListeners());
    ;
    //TODO deal wit exceptions
  }

  Future<bool> resetMeasuring() async {
    await stopMeasuring().whenComplete(() => {inputData.clear(),notifyListeners()});


    //TODO deal wit exceptions
  }
}
