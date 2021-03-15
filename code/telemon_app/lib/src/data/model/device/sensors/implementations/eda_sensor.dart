import 'dart:math';

import 'package:telemon_app/src/data/model/device/sensors/isensor.dart';
import 'package:telemon_app/src/data/model/device/sensors/utils/filters.dart';

class EdaSensor extends ISensor {
  EdaSensor()
      : super(
            TechnicalInfo(vcc: 3.3, measurementUnit: "𝜇S"),
            SensorDataInfo(maxValue: 12.0, minValue: 0.0, sensorGain: 0.132),
            LowPassFilter(
                sampleFrequency: 1000, //TODO change this to be dynamic
                highCutOff: 2.8));

  @override
  double applyTransferFunction(double valueSampled) {
    return (((valueSampled / pow(2, this.sensorDataInfo.channelBits)) *
            this.technicalInfo.vcc) /
        this.sensorDataInfo.sensorGain);
  }
}
