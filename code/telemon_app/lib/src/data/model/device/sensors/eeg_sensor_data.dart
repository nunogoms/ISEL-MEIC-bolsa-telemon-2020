import 'dart:math';

import '../isensor.dart';
import '../sensors_codes.dart';

class EegSensorData extends ISensor {
  EegSensorData() : super(TechnicalInfo(vcc: 3.3, measurementUnit: "𝜇V"),
  SensorDataInfo(maxValue: 40, minValue: -40, sensorGain: 41782));

  int differenceToUnit = 10^6;

  @override
  SensorsCodes getSensorCode() {
    return SensorsCodes.EEG;
  }

  @override
  double applyTransferFunction(double valueSampled) {
    return ((((valueSampled / pow(2, this.sensorDataInfo.channelBits)) - (1 / 2)) *
        this.technicalInfo.vcc)) /
        this.sensorDataInfo.sensorGain *
        differenceToUnit;
  }

  @override
  double applyFilter(double normalizedValue) => normalizedValue;
}