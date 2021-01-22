import '../isensor.dart';
import '../sensors_codes.dart';

class AccSensorData extends ISensor {
  AccSensorData()
      : super(TechnicalInfo(vcc: 3.3, measurementUnit: "g"),
      SensorDataInfo(maxValue: 3, minValue: -3, sensorGain: 1100));

  double cMin = 0;
  double cMax = 0;

  @override
  SensorsCodes getSensorCode() {
    return SensorsCodes.ACC;
  }

  @override
  double normalizeValue(double valueSampled) {
    if(cMin == cMax){
      cMin = - valueSampled;
      cMax= valueSampled;
    }
    return ((valueSampled - cMin) / (cMax - cMin)) * 2 - 1;
  }
}
