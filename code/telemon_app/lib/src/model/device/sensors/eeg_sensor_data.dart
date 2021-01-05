import 'dart:math';

import '../isensor.dart';
import '../sensors_codes.dart';

class EegSensorData extends ISensor {
  EegSensorData() : super("𝜇V", SensorTechnicalInfo(-40, 40, 41782));

  int differenceToUnit = 10^6;

  //Comes in millivolts
  @override
  double normalizeValue(double valueSampled) {
    return ((((valueSampled / pow(2, this.sensorInfo.channelBits)) - (1 / 2)) *
        this.sensorInfo.getVcc()) /
        this.sensorInfo.sensorGain) *
        differenceToUnit;
  }

  @override
  SensorsCodes getSensorCode() {
    return SensorsCodes.EEG;
  }
}