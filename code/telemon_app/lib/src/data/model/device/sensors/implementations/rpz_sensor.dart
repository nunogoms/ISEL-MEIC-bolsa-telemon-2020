
import 'dart:math';

import 'package:bitalino/bitalino.dart';
import 'package:telemon_app/src/data/model/device/sensors/utils/filters.dart';

import '../isensor.dart';

class RpzSensor extends ISensor {
  RpzSensor()
      : super(
      preferredFrequency: Frequency.HZ100,
      technicalInfo: TechnicalInfo(vcc: 3.3, measurementUnit: "%"),
      sensorDataInfo: SensorDataInfo(maxValue: 50, minValue: -50)){
    this.filterInfo = BandPassFilter(sampleFrequency: this.preferredFrequency, lowCutOff: 0.59, highCutOff: 0.9);
  }

  @override
  double applyTransferFunction(double valueSampled) {
    return ((valueSampled / pow(2, this.sensorDataInfo.channelBits))-(1/2)) * 100;
  }
}