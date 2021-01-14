import 'package:bitalino/bitalino.dart';
import 'package:telemon_app/src/data/model/device/isensor.dart';

class Exam {
  ISensor sensor;
  Frequency frequency;
  int duration; //Seconds
  String independentUnit;

  int maxSamples;
  int startingDatetime;
  int currentTime = 0;

  double secondsToShow = 2;//TODO move this

  final List<SensorValue> _fullExamValues = List<SensorValue>();

  Exam(
      {this.duration, this.sensor, this.frequency, this.independentUnit = "ms"})
      : maxSamples = serializeFrequency(frequency) * duration;

  bool addValue(double sampledValue) {
    if (_fullExamValues.isEmpty) {
      startingDatetime = DateTime.now().millisecondsSinceEpoch;
    } else if (_fullExamValues.length >= maxSamples) {
      return false;
    }

    SensorValue sensorValue = SensorValue(
        currentTime += (1000 / serializeFrequency(frequency)).toInt(),
        sensor.normalizeValue(sampledValue));
    _fullExamValues.add(sensorValue);
    return true;
  }

  List<SensorValue> getVisualValues() {
    var listLength = _fullExamValues.length;
    var maxSamplesToShow = (secondsToShow*serializeFrequency(frequency)).toInt();
    if(maxSamplesToShow<listLength) return _fullExamValues.sublist(listLength-maxSamplesToShow,listLength);
    else
      return _fullExamValues.sublist(0,listLength);
  }

  List<SensorValue> getAllValues() {
    return _fullExamValues;
  }

//TODO ter sempre exame à espera e remover caso isto seja fechado e o exame n tenha valores
}
