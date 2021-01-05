import 'package:telemon_app/src/model/device/sensors_codes.dart';

abstract class ISensor {
  String measurementUnit;
  SensorTechnicalInfo sensorInfo;

  SensorsCodes getSensorCode();

  ISensor(this.measurementUnit, this.sensorInfo);

  double normalizeValue(double valueSampled);
}

class SensorTechnicalInfo{
  double maxValue;
  double minValue;
  double sensorGain;
  int channelBits;

  //It is 10 by default, but can be changed
  SensorTechnicalInfo(this.maxValue, this.minValue, this.sensorGain, {this.channelBits=10});

  double getVcc() => maxValue.abs() + minValue.abs();
}

class SensorValue {
  final DateTime time;
  final double value;

  SensorValue(this.time, this.value);
}