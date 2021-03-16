import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:telemon_app/src/data/model/device/configurations/device_channels.dart';
import 'package:telemon_app/src/data/model/device/configurations/sensor_module.dart';
import 'package:telemon_app/src/data/model/measurements/exam.dart';
import 'package:telemon_app/src/data/model/measurements/measurement.dart';
import 'package:telemon_app/src/data/services/device_service/bitalino/bitalino_controller.dart';
import 'package:telemon_app/src/data/services/device_service/bitalino/bitalino_object.dart';
import 'package:telemon_app/src/data/services/device_service/contracts/idevice_controller.dart';
import 'package:telemon_app/src/data/services/file_service/exam_file_handler.dart';
import 'package:telemon_app/src/ui/viewmodels/settings_viewmodel.dart';

enum ExamState { INIT, MEASURING, FINISHED }

class MeasurementViewModel extends ChangeNotifier {
  final SensorModule sensorModule;
  final List<Exam> exams = [];
  final ExamFileHandler fileHandler = new ExamFileHandler();
  ExamState examState = ExamState.INIT;
  final ExamSettings examSettings;
  final Measurement measurement;

  //TODO alterar isto too
  static IDeviceController _deviceController = BitalinoController();

  @override
  void dispose() async {
    await _deviceController.stopAcquisition();
    //TODO ask se vale a pena reiniciar e descartar controller each time
    super.dispose();
  }

  MeasurementViewModel(this.sensorModule, this.examSettings)
      : measurement = Measurement(
            sensor: sensorModule.sensor,
            frequency: sensorModule.sensor.preferredFrequency,
            //TODO add a change in case of being present a new frequency in settings
            secondsToShow: examSettings.secondsToShow) {
    try {
      _deviceController.startAcquisition(
          BitalinoObject(sensorModule.name, examSettings.frequency, (frame) {
        try {
          bool addedSuccessfully = measurement.addValue(
              frame.analog[sensorModule.deviceChannel.value].toDouble());
          if (!addedSuccessfully) {
            stopMeasuring();
          }
          notifyListeners();
        } on Exception catch (Exception) {
          print(Exception); //TODO deal wit exceptions
          dispose();
        }
      }));
    } on Exception catch (Exception) {
      print(Exception); //TODO deal wit exceptions
    }
    notifyListeners();
    return;
  }

  Future<void> startMeasuring() async {
    measurement.startExam(examSettings.duration);
    examState = ExamState.MEASURING;

    //TODO uncomment for mocker
    /*
     try {
      await _deviceController.startAcquisition( MockObject(
          sensor.getSensorCode(), examSettings.sampleFrequency, (int frame) {
        if (examState != ExamState.MEASURING) return;

        bool addedSuccessfully = exams.last
            .addValue(frame.toDouble());

        if (!addedSuccessfully) {
          examState = ExamState.FINISHED;
          stopMeasuring();
        }
        notifyListeners();
      }));
    } on Exception catch (Exception) {
      print(Exception); //TODO deal wit exceptions
    }
    notifyListeners();
    return;
    */

    //TODO uncomment for Bitalino
  }

  Future<bool> stopMeasuring() async {
    examState = ExamState.FINISHED;
    exams.add(measurement.finishExam());
    return true;
    //TODO deal wit exceptions
  }

  Future<void> saveExam() async {
    examState = ExamState.INIT;
    Exam currExam = exams.last;

    fileHandler.setFilename("currExam.sensor.getSensorCode().toString()" +
        "_" +
        currExam.startingDatetime.toString());
    fileHandler.writeFile(currExam);
    notifyListeners();
  }

  Future<void> resetMeasuring() async {
    examState = ExamState.INIT;
    notifyListeners();

    //TODO deal wit exceptions
  }
}
