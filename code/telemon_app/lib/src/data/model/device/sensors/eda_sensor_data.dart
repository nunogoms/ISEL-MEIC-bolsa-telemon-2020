import 'dart:math';

import '../isensor.dart';
import '../sensors_codes.dart';

class EdaSensorData extends ISensor {
  EdaSensorData()
      : super(TechnicalInfo(vcc: 3.3, measurementUnit: "𝜇S"),
            SensorDataInfo(maxValue: 0, minValue: 10, sensorGain: 0.132));

  //Comes in millivolts
  @override
  double normalizeValue(double valueSampled) {
    return ((((valueSampled / pow(2, this.sensorDataInfo.channelBits)) *
            this.technicalInfo.vcc)) /
        this.sensorDataInfo.sensorGain);
  }

  @override
  SensorsCodes getSensorCode() {
    return SensorsCodes.EDA;
  }
}
