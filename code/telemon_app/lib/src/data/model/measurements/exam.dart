import 'package:bitalino/bitalino.dart';
import 'package:telemon_app/src/data/model/device/isensor.dart';

class Exam {
  final ISensor sensor;
  final Frequency frequency;
  final int duration; //Seconds
  final String independentUnit;

  late final int maxSamples;
  late final DateTime startingDatetime;
  late final int currentTime;


  final List<SensorValue> _fullExamValues = [];

  Exam({required this.duration,required this.sensor,required this.frequency, this.independentUnit = "ms"}){
    maxSamples = serializeFrequency(frequency) * duration;
    startingDatetime= DateTime.now();
  }


  List<SensorValue> getAllValues() {
    return _fullExamValues;
  }

  bool addValue(SensorValue sensorValue) {
    if(_fullExamValues.length >= maxSamples)return false;
    _fullExamValues.add(sensorValue);
    return true;
  }

//TODO ter sempre exame à espera e remover caso isto seja fechado e o exame n tenha valores
}
