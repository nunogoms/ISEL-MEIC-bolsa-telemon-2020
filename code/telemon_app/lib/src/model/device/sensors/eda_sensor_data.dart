import 'dart:math';

import '../isensor.dart';
import '../sensors_codes.dart';

class EdaSensorData extends ISensor {
  EdaSensorData() : super("𝜇S", SensorTechnicalInfo(0, 25, 0.132));

  int differenceToUnit = 10^-6;

  //Comes in millivolts
  @override
  double normalizeValue(double valueSampled) {
    return ((((valueSampled / pow(2, this.sensorInfo.channelBits)) *  this.sensorInfo.getVcc())) /
        this.sensorInfo.sensorGain) *
        differenceToUnit;
  }

  @override
  SensorsCodes getSensorCode() {
    return SensorsCodes.EDA;
  }
}