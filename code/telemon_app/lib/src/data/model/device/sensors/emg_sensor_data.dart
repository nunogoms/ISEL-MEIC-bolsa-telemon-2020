import 'dart:math';

import '../isensor.dart';
import '../sensors_codes.dart';

class EmgSensorData extends ISensor {
  EmgSensorData() : super(TechnicalInfo(vcc: 3.3, measurementUnit: "mV"),
      SensorDataInfo(maxValue: 1.7, minValue: -1.7, sensorGain: 1009));

  int differenceToUnit = 1000;

  //Comes in millivolts
  @override
  double normalizeValue(double valueSampled) {
    return ((((valueSampled / pow(2, this.sensorDataInfo.channelBits)) - (1 / 2)) *
        this.technicalInfo.vcc) /
        this.sensorDataInfo.sensorGain) *
        differenceToUnit;
  }

  @override
  SensorsCodes getSensorCode() {
    return SensorsCodes.EMG;
  }
}