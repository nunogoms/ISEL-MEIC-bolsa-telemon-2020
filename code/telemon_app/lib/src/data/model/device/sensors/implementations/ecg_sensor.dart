import 'dart:math';

import 'package:scidart/numdart.dart';
import 'package:telemon_app/src/data/model/device/sensors/isensor.dart';
import 'package:telemon_app/src/data/model/device/sensors/utils/filters.dart';

class EcgSensor extends ISensor {
  EcgSensor()
      : super(
            TechnicalInfo(vcc: 3.3, measurementUnit: "mV"),
            SensorDataInfo(maxValue: 1.5, minValue: -1.5, sensorGain: 1100),
            LowPassFilter(
                sampleFrequency: 1000, //TODO change this to be dynamic
                highCutOff: 40));

  int differenceToMilliVolt = 1000;

  @override
  double applyTransferFunction(double valueSampled) {
    return ((((valueSampled / pow(2, this.sensorDataInfo.channelBits)) -
                    (1 / 2)) *
                this.technicalInfo.vcc) /
            this.sensorDataInfo.sensorGain) *
        differenceToMilliVolt;
  }
}
