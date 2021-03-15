import 'package:bitalino/bitalino.dart';
import 'package:flutter/cupertino.dart';
import 'package:telemon_app/src/data/model/device/configurations/idevice.dart';
import 'package:telemon_app/src/data/model/settings/implementations/device_configuration_setting.dart';
import 'package:telemon_app/src/data/model/settings/implementations/frequency_setting.dart';

class ExamSettings {
  int secondsToShow;
  int duration;
  Frequency frequency;

  ExamSettings({this.secondsToShow = 2, this.duration = 15, this.frequency = Frequency.HZ1000});
}

class SettingsViewModel extends ChangeNotifier {
  late final ExamSettings examSettings; //TODO remove this as a part, and use only to export
  final FrequencySetting frequencySetting = FrequencySetting(Frequency.HZ1000);
  final DeviceConfigurationSetting deviceSetting = DeviceConfigurationSetting(DeviceImplementations.ISEL_BITALINO);

  SettingsViewModel() {
    examSettings = ExamSettings();
  }

  updateValues() => notifyListeners();

  ExamSettings getExamSettings(){
    //ExamSettings examSettings;
    examSettings.frequency = frequencySetting.currValue;
    return examSettings;
  }

  void setDuration(String? newDur) {
    final int minDuration = 15;
    this.examSettings.duration = int.parse(newDur==null? minDuration.toString(): newDur);
    if (this.examSettings.duration < this.examSettings.secondsToShow)
      this.examSettings.secondsToShow = getPossibleTimesToShow().last;
    notifyListeners();
  }

  void setSecondsToShow(String? newSecondsToShow) {
    final int minSecondsToShow = 2;
    this.examSettings.secondsToShow = int.parse(newSecondsToShow==null? minSecondsToShow.toString(): newSecondsToShow);
    notifyListeners();
  }

  List<int> getPossibleDurations() {
    final int minDuration = 15;
    final int numberOfOptions = 6;
    return List.generate(numberOfOptions, (index) => minDuration * (index + 1));
  }

  List<int> getPossibleTimesToShow() {
    final int minSecondsToShow = 2;
    final int numberOfOptions = 10;
    return List.generate(numberOfOptions, (index) => minSecondsToShow * (index + 1))
        .where((element) => element <= this.examSettings.duration)
        .toList();
  }
}
