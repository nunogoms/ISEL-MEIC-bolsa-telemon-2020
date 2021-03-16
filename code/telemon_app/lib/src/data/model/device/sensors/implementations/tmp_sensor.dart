
import 'dart:math';

import 'package:bitalino/bitalino.dart';

import '../isensor.dart';

class TmpSensor extends ISensor {
  TmpSensor()
      : super(
      preferredFrequency: Frequency.HZ10,
      technicalInfo: TechnicalInfo(vcc: 3.3, measurementUnit: "ºC"),
      sensorDataInfo: SensorDataInfo(maxValue: 30, minValue: 45)){
    this.filterInfo = null;
  }

  @override
  double applyTransferFunction(double valueSampled) {
    return (((valueSampled / pow(2, this.sensorDataInfo.channelBits))*this.technicalInfo.vcc)-0.5) * 100;
  }
}