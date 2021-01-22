enum SensorsCodes { EMG, ECG, EDA, EEG, ACC }

extension SensorNumber on SensorsCodes {
  int get value {
    switch (this) {
      case SensorsCodes.EMG:
        return 0;
      case SensorsCodes.ECG:
        return 1;
      case SensorsCodes.EDA:
        return 2;
      case SensorsCodes.EEG:
        return 3;
      case SensorsCodes.ACC:
        return 4;
    }
    throw new Exception(
        "The value $this is not a valid sensor"); //TODO exception management and string
  }
}
