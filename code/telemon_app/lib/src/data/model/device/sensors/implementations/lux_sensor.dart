import 'dart:math';

import 'package:bitalino/bitalino.dart';

import '../isensor.dart';

class LuxSensor extends ISensor {
  LuxSensor()
      : super(
      preferredFrequency: Frequency.HZ100,
      technicalInfo: TechnicalInfo(vcc: 3.3, measurementUnit: "%"),
      sensorDataInfo: SensorDataInfo(maxValue: 100, minValue: 0)){
    this.filterInfo = null;
  }

  @override
  double applyTransferFunction(double valueSampled) {
    return (valueSampled / pow(2, this.sensorDataInfo.channelBits)) * 100;
  }
}