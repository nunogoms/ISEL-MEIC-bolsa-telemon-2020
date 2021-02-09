import 'package:flutter/cupertino.dart';
import 'package:telemon_app/src/data/model/device/isensor.dart';
import 'package:telemon_app/src/data/model/exams/exam.dart';
import 'package:telemon_app/src/data/services/device_service/bitalino/bitalino_object.dart';
import 'package:telemon_app/src/data/services/device_service/contracts/idevice_controller.dart';
import 'package:telemon_app/src/data/services/device_service/mocker/mock_controller.dart';
import 'package:telemon_app/src/data/services/device_service/mocker/mock_object.dart';
import 'file:///C:/Users/nunom/Documents/ISEL/Bolsa-Telemonitorization/CODE-ISEL-MEIC-bolsa-telemon-2020/code/telemon_app/lib/src/data/services/device_service/bitalino/bitalino_controller.dart';
import 'package:telemon_app/src/data/services/file_service/exam_file_handler.dart';
import 'package:telemon_app/src/ui/viewmodels/settings_viewmodel.dart';

enum ExamState { INIT, MEASURING, FINISHED }

class ExamViewModel extends ChangeNotifier {
  final ISensor sensor;
  final List<Exam> exams;
  final ExamFileHandler fileHandler = new ExamFileHandler();
  ExamState examState = ExamState.INIT;
  final ExamSettings examSettings;

  static IDeviceController _deviceController = MockController();

  ExamViewModel(this.sensor, this.examSettings)
      : exams = [
          Exam(
              duration: examSettings.duration,
              sensor: sensor,
              frequency: examSettings.sampleFrequency,
              secondsToShow: examSettings.secondsToShow)
        ];

  Future<void> startMeasuring() async {
    examState = ExamState.MEASURING;
    exams.add(Exam(
        duration: examSettings.duration,
        sensor: sensor,
        frequency: examSettings.sampleFrequency,
        secondsToShow: examSettings.secondsToShow));

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

   /* try { //TODO uncomment for Bitalino
      await _deviceController.startAcquisition( BitalinoObject(
          sensor.getSensorCode(), examSettings.sampleFrequency, (frame) {
        if (examState != ExamState.MEASURING) return;
        bool addedSuccessfully = exams.last
            .addValue(frame.analog[sensor.getSensorCode().index].toDouble());
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
    return;*/
  }

  Future<bool> stopMeasuring() async {
    examState = ExamState.FINISHED;
    return await _deviceController
        .stopAcquisition()
        .whenComplete(() => notifyListeners());
    //TODO deal wit exceptions
  }

  Future<void> saveExam() async {
    Exam currExam = exams.last;
    resetMeasuring();

    fileHandler.setFilename(currExam.sensor.getSensorCode().toString() +
        "_" +
        DateTime.fromMillisecondsSinceEpoch(currExam.startingDatetime)
            .toString());
    fileHandler.writeFile(currExam);
  }

  Future<void> resetMeasuring() async {
    await stopMeasuring()
        .whenComplete(() => {
              exams.add(Exam(
                  duration: examSettings.duration,
                  sensor: sensor,
                  frequency: examSettings.sampleFrequency,
                  secondsToShow: examSettings.secondsToShow)),
              notifyListeners()
            })
        .whenComplete(() => examState = ExamState.INIT);

    //TODO deal wit exceptions
  }
}
