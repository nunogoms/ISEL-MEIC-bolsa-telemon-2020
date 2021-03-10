import 'package:bitalino/bitalino.dart';
import 'package:flutter/cupertino.dart';

class ExamSettings {
  Frequency sampleFrequency;
  int secondsToShow;
  int duration;

  ExamSettings({this.sampleFrequency = Frequency.HZ1000, this.secondsToShow = 2, this.duration = 15});
}

class SettingsViewModel extends ChangeNotifier {
  final int minDuration = 15;
  final int minSecondsToShow = 2;
  late final ExamSettings examSettings;

  SettingsViewModel() {
    examSettings = ExamSettings();
  }

  List<Frequency> getPossibleFrequencies() {
    return [Frequency.HZ1, Frequency.HZ10, Frequency.HZ100, Frequency.HZ1000];
  }

  void setSampleFrequency(String? frequency) {
    List<Frequency> frequencies = getPossibleFrequencies();
    Frequency newFreq =
        frequencies.firstWhere((element) => element.toString() == frequency);
    this.examSettings.sampleFrequency = newFreq;
    notifyListeners();
  }

  void setDuration(String? newDur) {
    this.examSettings.duration = int.parse(newDur==null? minDuration.toString(): newDur);
    if (this.examSettings.duration < this.examSettings.secondsToShow)
      this.examSettings.secondsToShow = getPossibleTimesToShow().last;
    notifyListeners();
  }

  void setSecondsToShow(String? newSecondsToShow) {
    this.examSettings.secondsToShow = int.parse(newSecondsToShow==null? minSecondsToShow.toString(): newSecondsToShow);
    notifyListeners();
  }

  List<int> getPossibleDurations() {
    return List.generate(6, (index) => minDuration * (index + 1));
  }

  List<int> getPossibleTimesToShow() {
    return List.generate(10, (index) => minSecondsToShow * (index + 1))
        .where((element) => element <= this.examSettings.duration)
        .toList();
  }
}
