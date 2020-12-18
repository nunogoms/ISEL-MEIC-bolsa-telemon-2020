import 'dart:io';

enum Sensors {
  EMG,
  ECG,
  EDA,
  EEG
}

extension SensorNumber on Sensors {
  int get value {
    switch(this) {
      case Sensors.EMG:
        return 0;
      case Sensors.ECG:
        return 1;
      case Sensors.EDA:
        return 2;
      case Sensors.EEG:
        return 3;
    }
    throw new Exception("The value $this is not a valid sensor");//TODO exception management and string
  }
}