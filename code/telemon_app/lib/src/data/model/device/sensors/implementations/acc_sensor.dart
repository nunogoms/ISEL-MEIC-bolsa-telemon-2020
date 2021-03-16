import 'package:bitalino/bitalino.dart';
import 'package:telemon_app/src/data/model/device/sensors/utils/filters.dart';

import '../isensor.dart';

class AccSensor extends ISensor {
  AccSensor()
      : super(
            preferredFrequency: Frequency.HZ100,
            technicalInfo: TechnicalInfo(vcc: 3.3, measurementUnit: "g"),
            sensorDataInfo:
                SensorDataInfo(maxValue: 3, minValue: -3, sensorGain: 1100)) {
    this.filterInfo = LowPassFilter(
        order: 1, sampleFrequency: this.preferredFrequency, highCutOff: 2.8);
  }

  double cMin = 0;
  double cMax = 0;

  @override
  double applyTransferFunction(double valueSampled) {
    if (cMin == cMax) {
      cMin = -valueSampled;
      cMax = valueSampled;
    }
    return ((valueSampled - cMin) / (cMax - cMin)) * 2 - 1;
  }
}
