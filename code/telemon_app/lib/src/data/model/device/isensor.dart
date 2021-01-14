import 'package:telemon_app/src/data/model/device/sensors_codes.dart';

abstract class ISensor {
  TechnicalInfo technicalInfo;
  SensorDataInfo sensorDataInfo;

  SensorsCodes getSensorCode();

  double normalizeValue(double valueSampled);

  ISensor(this.technicalInfo, this.sensorDataInfo);
}

class SensorDataInfo {
  double maxValue;
  double minValue;
  double sensorGain;
  int channelBits;

  SensorDataInfo(
      {this.maxValue, this.minValue, this.sensorGain, this.channelBits = 10});
}

class TechnicalInfo {
  double vcc;
  String measurementUnit;

  TechnicalInfo({this.vcc, this.measurementUnit});
}

class SensorValue {
  final num timeInMillis;
  final double value;

  SensorValue(this.timeInMillis, this.value);
}
