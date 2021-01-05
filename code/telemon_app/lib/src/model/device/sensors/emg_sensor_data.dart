import 'dart:math';

import '../isensor.dart';
import '../sensors_codes.dart';

class EmgSensorData extends ISensor {
  EmgSensorData() : super("mV", SensorTechnicalInfo(1.64, -1.64, 1009));

  int differenceToUnit = 1000;

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
    return SensorsCodes.EMG;
  }
}