import 'dart:math';

import 'package:scidart/src/numdart/arrays_base/array.dart';

import '../filters.dart';
import '../isensor.dart';
import '../sensors_codes.dart';

class EdaSensorData extends ISensor {
  EdaSensorData()
      : super(TechnicalInfo(vcc: 3.3, measurementUnit: "𝜇S"),
            SensorDataInfo(maxValue: 12.0, minValue: 0.0, sensorGain: 0.132),
      LowPassFilter(
          sampleFrequency: 1000, //TODO change this to be dynamic
          highCutOff: 2.8));

  @override
  SensorsCodes getSensorCode() {
    return SensorsCodes.EDA;
  }

  @override
  double applyTransferFunction(double valueSampled) {
    return (((valueSampled / pow(2, this.sensorDataInfo.channelBits)) *
            this.technicalInfo.vcc) /
        this.sensorDataInfo.sensorGain);
  }
}
