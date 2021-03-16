import 'dart:math';

import 'package:bitalino/bitalino.dart';
import 'package:telemon_app/src/data/model/device/sensors/isensor.dart';
import 'package:telemon_app/src/data/model/device/sensors/utils/filters.dart';

class EdaSensor extends ISensor {
  EdaSensor()
      : super(
            preferredFrequency: Frequency.HZ100,
            technicalInfo: TechnicalInfo(vcc: 3.3, measurementUnit: "𝜇S"),
            sensorDataInfo: SensorDataInfo(
                maxValue: 12.0, minValue: 0.0, sensorGain: 0.132)) {
    this.filterInfo = LowPassFilter(
        sampleFrequency: this.preferredFrequency, highCutOff: 2.8);
  }

  @override
  double applyTransferFunction(double valueSampled) {
    return (((valueSampled / pow(2, this.sensorDataInfo.channelBits)) *
            this.technicalInfo.vcc) /
        this.sensorDataInfo.sensorGain);
  }
}
