import 'package:flutter/cupertino.dart';
import 'package:telemon_app/src/data/model/device/sensors_codes.dart';

abstract class ISensor {
  TechnicalInfo technicalInfo;
  SensorDataInfo sensorDataInfo;

  /// Returns the code of the sensors that is being used
  SensorsCodes getSensorCode();

  /// In this method, it is implemented the transfer function, so the values
  /// come in the real unit, instead of [0..1024] units (not specified) that come
  /// from the sensor.
  @protected
  double applyTransferFunction(double valueSampled);

  /// This method is to be implemented by each sensor, and each of them will implement
  /// its own function to filter the results to a more suitable end graph
  @protected
  double applyFilter(double normalizedValue);

  /// Only public method to be used, since it applies the transfer function, and then
  /// it applies the filters, and returns the best possible result for this kind of
  /// sensor
  double normalizeAndFilterValue(double valueSampled) => applyFilter(applyTransferFunction(valueSampled));

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
