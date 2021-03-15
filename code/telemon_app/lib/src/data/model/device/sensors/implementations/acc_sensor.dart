import 'package:telemon_app/src/data/model/device/sensors/utils/filters.dart';

import '../isensor.dart';

class AccSensor extends ISensor {
  AccSensor()
      : super(
            TechnicalInfo(vcc: 3.3, measurementUnit: "g"),
            SensorDataInfo(maxValue: 3, minValue: -3, sensorGain: 1100),
            LowPassFilter(
                order: 1,
                sampleFrequency: 1000, //TODO change this to be dynamic
                highCutOff: 50));

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
