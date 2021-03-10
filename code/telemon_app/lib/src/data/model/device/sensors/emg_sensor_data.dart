import 'dart:math';

import 'package:scidart/src/numdart/arrays_base/array.dart';

import '../filters.dart';
import '../isensor.dart';
import '../sensors_codes.dart';

class EmgSensorData extends ISensor {
  EmgSensorData()
      : super(
            TechnicalInfo(vcc: 3.3, measurementUnit: "mV"),
            SensorDataInfo(maxValue: 1.7, minValue: -1.7, sensorGain: 1009),
            BandPassFilter(
                sampleFrequency: 1000, //TODO change this to be dynamic
                lowCutOff: 25,
                highCutOff: 480));

  int differenceToUnit = 1000;

  @override
  SensorsCodes getSensorCode() {
    return SensorsCodes.EMG;
  }

  @override
  double applyTransferFunction(double valueSampled) {
    return ((((valueSampled / pow(2, this.sensorDataInfo.channelBits)) -
                    (1 / 2)) *
                this.technicalInfo.vcc) /
            this.sensorDataInfo.sensorGain) *
        differenceToUnit;
  }
}
