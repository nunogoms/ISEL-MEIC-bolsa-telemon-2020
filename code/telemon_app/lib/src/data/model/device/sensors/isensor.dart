import 'package:bitalino/bitalino.dart';
import 'package:flutter/cupertino.dart';
import 'package:scidart/numdart.dart';
import 'package:scidart/scidart.dart';
import 'package:telemon_app/src/data/model/device/sensors/utils/filters.dart';

abstract class ISensor {
  final Frequency preferredFrequency;
  final TechnicalInfo technicalInfo;
  final SensorDataInfo sensorDataInfo;

  /// It needs to be setup here so the coefficients are calculated only once
  /// since they have a lot of overhead to be calculated,
  late final Filter? filterInfo; //

  ISensor({required this.preferredFrequency,required this.technicalInfo, required this.sensorDataInfo});

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
  double normalizeAndFilterValue(
      Iterable<double> oldValues, double valueSampled) {
    if (this.filterInfo == null) {
      return applyTransferFunction(valueSampled);
    } else {
      var realFilterInfo = filterInfo!;
      return lfilter(
          realFilterInfo.filterCoefficients,
          Array([1.0]),
          Array([
            ...oldValues
                .skip(oldValues.length > 0
                    ? oldValues.length > realFilterInfo.numTaps
                        ? oldValues.length - realFilterInfo.numTaps
                        : oldValues.length
                    : 0)
                .toList(),
            applyTransferFunction(valueSampled)
          ])).last; //To get only the last number
    }
  }
}

class SensorDataInfo {
  final double maxValue;
  late final double minValue;
  double sensorGain;
  int channelBits;

  SensorDataInfo(
      {required this.maxValue,
      required this.minValue,
      this.sensorGain = 0,
      this.channelBits = 10});
}

class TechnicalInfo {
  final double vcc;
  final String measurementUnit;

  TechnicalInfo({this.vcc = 3.3, required this.measurementUnit});
}

class SensorValue {
  final num timeInMillis;
  final double value;

  SensorValue(this.timeInMillis, this.value);
}
