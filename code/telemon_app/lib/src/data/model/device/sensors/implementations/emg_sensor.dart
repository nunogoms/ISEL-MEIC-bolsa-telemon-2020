import 'dart:math';

import 'package:bitalino/bitalino.dart';
import 'package:telemon_app/src/data/model/device/sensors/isensor.dart';
import 'package:telemon_app/src/data/model/device/sensors/utils/filters.dart';

class EmgSensor extends ISensor {
  EmgSensor()
      : super(
            preferredFrequency: Frequency.HZ100,
            technicalInfo: TechnicalInfo(vcc: 3.3, measurementUnit: "mV"),
            sensorDataInfo:
                SensorDataInfo(maxValue: 1.7, minValue: -1.7, sensorGain: 1009)){
    this.filterInfo= BandPassFilter(
        sampleFrequency: this.preferredFrequency,
        lowCutOff: 25,
        highCutOff: 480);
  }

  int differenceToUnit = 1000;

  @override
  double applyTransferFunction(double valueSampled) {
    return ((((valueSampled / pow(2, this.sensorDataInfo.channelBits)) -
                    (1 / 2)) *
                this.technicalInfo.vcc) /
            this.sensorDataInfo.sensorGain) *
        differenceToUnit;
  }
}
