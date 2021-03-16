import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:telemon_app/src/data/model/device/sensors/sensor_name.dart';
import 'package:telemon_app/src/general/consts/globals.dart';
import 'package:telemon_app/src/general/theme/colors.dart';

class MeasurementVisualInfo {
  final Function(BuildContext) measurementName;
  final Color buttonColor;

  MeasurementVisualInfo(this.measurementName, this.buttonColor);
}

Map<SensorName, MeasurementVisualInfo> measurementsVisualInfoMap = {
  /*SensorName.WEIGHT: MeasurementVisualInfo(
      l10n(context).weightMeasurement, ThemeColors.misc.MEASUREMENTS_SCALE),*/
  SensorName.ECG: MeasurementVisualInfo(
      (context) => l10n(context).ecgMeasurement,
      ThemeColors.misc.MEASUREMENTS_ECG),
  SensorName.EMG: MeasurementVisualInfo(
      (context) => l10n(context).emgMeasurement,
      ThemeColors.misc.MEASUREMENTS_EMG),
  SensorName.EEG: MeasurementVisualInfo(
      (context) => l10n(context).eegMeasurement,
      ThemeColors.misc.MEASUREMENTS_EEG),
  SensorName.ACC: MeasurementVisualInfo(
      (context) => l10n(context).accMeasurement,
      ThemeColors.misc.MEASUREMENTS_OTHER),
  SensorName.EDA: MeasurementVisualInfo(
      (context) => l10n(context).edaMeasurement,
      ThemeColors.misc.MEASUREMENTS_OTHER),
  SensorName.LUX: MeasurementVisualInfo(
          (context) => l10n(context).luxMeasurement,
      ThemeColors.misc.MEASUREMENTS_OTHER),
};
