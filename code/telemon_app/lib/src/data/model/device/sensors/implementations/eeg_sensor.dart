import 'dart:math';

import 'package:telemon_app/src/data/model/device/sensors/isensor.dart';
import 'package:telemon_app/src/data/model/device/sensors/utils/filters.dart';

class EegSensor extends ISensor {
  EegSensor()
      : super(
            TechnicalInfo(vcc: 3.3, measurementUnit: "𝜇V"),
            SensorDataInfo(maxValue: 40, minValue: -40, sensorGain: 41782),
            LowPassFilter(
                sampleFrequency: 1000, //TODO change this to be dynamic
                highCutOff: 40));

  int differenceToUnit = 10 ^ 6;

  @override
  double applyTransferFunction(double valueSampled) {
    return ((((valueSampled / pow(2, this.sensorDataInfo.channelBits)) -
                (1 / 2)) *
            this.technicalInfo.vcc)) /
        this.sensorDataInfo.sensorGain *
        differenceToUnit;
  }
}
