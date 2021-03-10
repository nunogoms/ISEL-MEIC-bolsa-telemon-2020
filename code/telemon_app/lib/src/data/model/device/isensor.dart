import 'package:flutter/cupertino.dart';
import 'package:scidart/numdart.dart';
import 'package:scidart/scidart.dart';
import 'package:telemon_app/src/data/model/device/filters.dart';
import 'package:telemon_app/src/data/model/device/sensors_codes.dart';

abstract class ISensor {
  TechnicalInfo technicalInfo;
  SensorDataInfo sensorDataInfo;
  Filter filterInfo;

  /// Returns the code of the sensors that is being used
  SensorsCodes getSensorCode();

  /// In this method, it is implemented the transfer function, so the values
  /// come in the real unit, instead of [0..1024] units (not specified) that come
  /// from the sensor.
  @protected
  double applyTransferFunction(double valueSampled);

  /// This method is to be implemented by each sensor, and each of them will implement
  /// its own function to filter the results to a more suitable end graph
  ///

  /// Only public method to be used, since it applies the transfer function, and then
  /// it applies the filters, and returns the best possible result for this kind of
  /// sensor
  double normalizeAndFilterValue(Iterable<double> oldValues,double valueSampled) =>

        lfilter(this.filterInfo.filterCoefficients,
          Array([1.0]),
          Array([...oldValues.skip(oldValues.length<=filterInfo.numTaps? 0 : oldValues.length-filterInfo.numTaps ).toList(),
            applyTransferFunction(valueSampled)]))
        [oldValues.length<=filterInfo.numTaps? 0 : filterInfo.numTaps];//To get only the last number

  ISensor(this.technicalInfo, this.sensorDataInfo, this.filterInfo);
}


class SensorDataInfo {
  final double maxValue;
  late final double minValue;
  double sensorGain;
  int channelBits;

  SensorDataInfo(
      {required this.maxValue, required this.minValue, required this.sensorGain,this.channelBits = 10});
}

class TechnicalInfo {
  final double vcc;
  final String measurementUnit;

  TechnicalInfo({this.vcc=3.3, required this.measurementUnit});
}

class SensorValue {
  final num timeInMillis;
  final double value;

  SensorValue(this.timeInMillis, this.value);
}
