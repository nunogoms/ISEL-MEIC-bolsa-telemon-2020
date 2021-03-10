import 'dart:math';

import 'package:scidart/numdart.dart';
import 'package:scidart/scidart.dart';
import 'package:telemon_app/src/data/model/device/filters.dart';

import '../isensor.dart';
import '../sensors_codes.dart';

class EcgSensorData extends ISensor {
  EcgSensorData()
      : super(
            TechnicalInfo(vcc: 3.3, measurementUnit: "mV"),
            SensorDataInfo(maxValue: 1.5, minValue: -1.5, sensorGain: 1100),
            BandPassFilter(
                sampleFrequency: 1000, //TODO change this to be dynamic
                lowCutOff: 0.5,
                highCutOff: 40));

  int differenceToMilliVolt = 1000;

  @override
  SensorsCodes getSensorCode() {
    return SensorsCodes.ECG;
  }

  @override
  double applyTransferFunction(double valueSampled) {
    return ((((valueSampled / pow(2, this.sensorDataInfo.channelBits)) -
                    (1 / 2)) *
                this.technicalInfo.vcc) /
            this.sensorDataInfo.sensorGain) *
        differenceToMilliVolt;
  }
}