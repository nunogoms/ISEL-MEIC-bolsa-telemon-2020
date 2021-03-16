import 'package:bitalino/bitalino.dart';
import 'package:telemon_app/src/data/model/device/sensors/isensor.dart';

import 'package:telemon_app/src/data/utils/units.dart';

import 'exam.dart';

class Measurement {
  final ISensor sensor;
  final Frequency frequency;
  final String independentUnit;

  late final int secondsToShow;
  late final int maxSamplesToShow;
  int currentTime = 0;

  Exam? currentExam;

  final List<SensorValue> _recentMeasureSensorValues = [];

  //TODO passar esta unidade independente p algum lado que faca sentido
  Measurement(
      {required this.sensor,
      required this.frequency,
      required this.secondsToShow,
      this.independentUnit = "ms"}) {
    maxSamplesToShow =
        ((secondsToShow) * serializeFrequency(sensor.preferredFrequency)).toInt();
  }

  List<SensorValue> getVisualValues() {
    return _recentMeasureSensorValues;
  }

  bool addValue(double sampledValue) {
    if (maxSamplesToShow < _recentMeasureSensorValues.length)
      _recentMeasureSensorValues.removeAt(0);

    Iterable<double> values =
        _recentMeasureSensorValues.map((element) => element.value);

    SensorValue sensorValue = SensorValue(
        currentTime += Units.convertToMillis(frequency),
        sensor.normalizeAndFilterValue(values, sampledValue));

    _recentMeasureSensorValues.add(sensorValue);
    if (currentExam != null) currentExam!.addValue(sensorValue);
    return true;
  }

  bool startExam(
    int duration,
  ) {
    try {
      currentExam = Exam(
          duration: duration,
          sensor: sensor,
          frequency: frequency,
          independentUnit: independentUnit);
      return true;
    } catch (e) {
      return false;
    }
  }

  Exam finishExam() {
    Exam currExam = currentExam!;
    currentExam = null;
    return currExam;
  }
}
