import 'dart:math';

import 'package:telemon_app/src/model/device/sensors_codes.dart';

import '../isensor.dart';

class EcgSensorData extends ISensor {
  EcgSensorData() : super("mV", SensorTechnicalInfo(1.5, -1.5, 1100));

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
    return SensorsCodes.ECG;
  }
}
