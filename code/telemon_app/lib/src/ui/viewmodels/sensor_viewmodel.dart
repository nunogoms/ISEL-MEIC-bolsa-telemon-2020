import 'package:bitalino/bitalino.dart';
import 'package:flutter/cupertino.dart';
import 'package:telemon_app/src/data/model/device/isensor.dart';
import 'package:telemon_app/src/data/model/exams/exam.dart';
import 'package:telemon_app/src/data/services/device_service/bitalino_controller.dart';
import 'package:telemon_app/src/data/services/file_service/exam_file_handler.dart';
import 'package:telemon_app/src/ui/viewmodels/settings_viewmodel.dart';

final int duration = 60;

class SensorViewModel extends ChangeNotifier {
  final ISensor sensor;
  final List<Exam> exams;
  final ExamFileHandler fileHandler = new ExamFileHandler();
  bool measuring = false;

  static BitalinoController _deviceController = BitalinoController();

  SensorViewModel(this.sensor):
        exams = [Exam(
  duration: duration,
  sensor: sensor,
  frequency: SettingsViewModel.sampleFrequency)];

  Future<void> startMeasuring() async {
    measuring=true;
    exams.add(Exam(
        duration: duration,
        sensor: sensor,
        frequency: SettingsViewModel.sampleFrequency));

    try {
      await _deviceController.startAcquisition(
          sensor.getSensorCode(), SettingsViewModel.sampleFrequency, (frame) {
            if(!measuring)return;
        bool addedSuccessfully = exams.last
            .addValue(frame.analog[sensor.getSensorCode().index].toDouble());
        if(!addedSuccessfully) {
          measuring = false;
          stopMeasuring();
        }
        notifyListeners();

      });
    } on Exception catch (Exception) {
      print(Exception); //TODO deal wit exceptions
    }
    notifyListeners();
    return;
  }

  Future<bool> stopMeasuring() async {
    measuring= false;
    return await _deviceController
        .stopAcquisition()
        .whenComplete(() => notifyListeners());
    //TODO deal wit exceptions
  }

  Future<void> saveExam() async {
    Exam currExam = exams.last;
    resetMeasuring();

    fileHandler.setFilename(currExam.sensor.getSensorCode().toString()+"_" + DateTime.fromMillisecondsSinceEpoch(currExam.startingDatetime).toString());
    await fileHandler.writeFile(currExam);
  }

  Future<bool> resetMeasuring() async {
    await stopMeasuring()
        .whenComplete(() => {
          exams.add(Exam(
              duration: duration,
              sensor: sensor,
              frequency: SettingsViewModel.sampleFrequency))
          , notifyListeners()});

    //TODO deal wit exceptions
  }
}
