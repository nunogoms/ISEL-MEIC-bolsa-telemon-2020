import 'dart:math';

import '../isensor.dart';
import '../sensors_codes.dart';

class EdaSensorData extends ISensor {
  EdaSensorData()
      : super(TechnicalInfo(vcc: 3.3, measurementUnit: "𝜇S"),
            SensorDataInfo(maxValue: 12.0, minValue: 0.0, sensorGain: 0.132));

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

  @override
  double applyFilter(double normalizedValue) => normalizedValue;
}
