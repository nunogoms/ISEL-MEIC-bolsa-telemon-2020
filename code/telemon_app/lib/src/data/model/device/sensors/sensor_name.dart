enum SensorName {
  //Electromyogram
  EMG,

  //Electrocardiogram
  ECG,

  //Electrodermal Activity
  EDA,

  // Electroencephalogram
  EEG,

  // Acceleration
  ACC,

  // Light Intensity
  LUX,

  // Respiration
  RPZ,

  //Temperature
  TMP,
}

extension fullName on SensorName {
  String get value {
    switch (this) {
      case SensorName.EMG:
        return "Electromyogram";
      case SensorName.ECG:
        return "Electrocardiogram";
      case SensorName.EDA:
        return "Electrodermal Activity";
      case SensorName.EEG:
        return "Electroencephalogram";
      case SensorName.ACC:
        return "Acceleration";
      case SensorName.LUX:
        return "Light Intensity";
      case SensorName.RPZ:
        return "Respiration";
      case SensorName.TMP:
        return "Temperature";
    }
  }
}
