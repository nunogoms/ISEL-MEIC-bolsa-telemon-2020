import 'package:bitalino/bitalino.dart';
import 'package:telemon_app/src/data/model/device/isensor.dart';

class Exam {
  ISensor sensor;
  Frequency frequency;
  int duration; //Seconds
  String independentUnit;

  int maxSamples;
  DateTime startingDatetime;
  int currentTime = 0;

  int secondsToShow;
  int maxSamplesToShow;


  final List<SensorValue> _fullExamValues = List<SensorValue>();

  Exam({this.duration, this.sensor, this.frequency,this.secondsToShow, this.independentUnit = "ms"}){
    maxSamplesToShow = (secondsToShow*serializeFrequency(frequency)).toInt();
    maxSamples = serializeFrequency(frequency) * duration;
    startingDatetime= DateTime.now();
  }



  bool addValue(double sampledValue) {
    if(_fullExamValues.length >= maxSamples)return false;

    SensorValue sensorValue = SensorValue(
        currentTime += (1000 / serializeFrequency(frequency)).toInt(),//todo
        sensor.normalizeAndFilterValue(sampledValue));
    _fullExamValues.add(sensorValue);
    return true;
  }

  List<SensorValue> getVisualValues() {
    var listLength = _fullExamValues.length;
    if(maxSamplesToShow<listLength)
      return _fullExamValues.sublist(listLength-maxSamplesToShow,listLength);
    else
      return _fullExamValues.sublist(0,listLength);
  }

  List<SensorValue> getAllValues() {
    return _fullExamValues;
  }

//TODO ter sempre exame à espera e remover caso isto seja fechado e o exame n tenha valores
}
