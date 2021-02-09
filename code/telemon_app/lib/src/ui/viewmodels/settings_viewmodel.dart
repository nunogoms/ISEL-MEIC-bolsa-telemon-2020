import 'package:bitalino/bitalino.dart';
import 'package:flutter/cupertino.dart';

class ExamSettings {
  Frequency sampleFrequency = Frequency.HZ1000;
  int secondsToShow = 2;
  int duration = 15;

  ExamSettings({this.sampleFrequency, this.secondsToShow, this.duration});
}

class SettingsViewModel extends ChangeNotifier {
  final startDuration = 15;
  final startSecondsToShow = 2;
  ExamSettings examSettings;

  SettingsViewModel() {
    examSettings = ExamSettings(
        sampleFrequency: Frequency.HZ1000,
        secondsToShow: this.startSecondsToShow,
        duration: this.startDuration);
  }

  List<Frequency> getPossibleFrequencies() {
    return [Frequency.HZ1, Frequency.HZ10, Frequency.HZ100, Frequency.HZ1000];
  }

  void setSampleFrequency(String frequency) {
    List<Frequency> frequencies = getPossibleFrequencies();
    Frequency newFreq =
        frequencies.firstWhere((element) => element.toString() == frequency);
    this.examSettings.sampleFrequency = newFreq;
    notifyListeners();
  }

  void setDuration(String newDur) {
    this.examSettings.duration = int.parse(newDur);
    if (this.examSettings.duration < this.examSettings.secondsToShow)
      this.examSettings.secondsToShow = getPossibleTimesToShow().last;
    notifyListeners();
  }

  void setSecondsToShow(String newDur) {
    this.examSettings.secondsToShow = int.parse(newDur);
    notifyListeners();
  }

  List<int> getPossibleDurations() {
    return List.generate(6, (index) => startDuration * (index + 1));
  }

  List<int> getPossibleTimesToShow() {
    return List.generate(10, (index) => startSecondsToShow * (index + 1))
        .where((element) => element <= this.examSettings.duration)
        .toList();
  }
}
