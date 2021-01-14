import 'dart:math';


import '../isensor.dart';
import '../sensors_codes.dart';

class EcgSensorData extends ISensor {
  EcgSensorData()
      : super(TechnicalInfo(vcc: 3.3, measurementUnit: "mV"),
            SensorDataInfo(maxValue: 1.5, minValue: -1.5, sensorGain: 1100));

  int differenceToMilliVolt = 1000;

  @override
  SensorsCodes getSensorCode() {
    return SensorsCodes.ECG;
  }

  @override
  double normalizeValue(double valueSampled) {
    return ((((valueSampled / pow(2, this.sensorDataInfo.channelBits)) -
                (1 / 2)) *
            this.technicalInfo.vcc) /
        this.sensorDataInfo.sensorGain)* differenceToMilliVolt;
  }
}
