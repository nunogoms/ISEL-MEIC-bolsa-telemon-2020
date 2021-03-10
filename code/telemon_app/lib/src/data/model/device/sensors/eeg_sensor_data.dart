import 'dart:math';

import 'package:scidart/src/numdart/arrays_base/array.dart';

import '../filters.dart';
import '../isensor.dart';
import '../sensors_codes.dart';

class EegSensorData extends ISensor {
  EegSensorData() : super(TechnicalInfo(vcc: 3.3, measurementUnit: "𝜇V"),
  SensorDataInfo(maxValue: 40, minValue: -40, sensorGain: 41782),
      BandPassFilter(
          sampleFrequency: 1000, //TODO change this to be dynamic
          lowCutOff: 0.5,
          highCutOff: 40));

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
}