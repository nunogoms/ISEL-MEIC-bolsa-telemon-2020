import 'package:bitalino/bitalino.dart';
import 'package:flutter/cupertino.dart';

class ExamSettings {
  Frequency sampleFrequency = Frequency.HZ1000;
  int secondsToShow = 2;
  int duration = 15;

  ExamSettings({this.sampleFrequency, this.secondsToShow, this.duration});
}

class SettingsViewModel extends ChangeNotifier {
  ExamSettings examSettings = ExamSettings(
      sampleFrequency: Frequency.HZ1000, secondsToShow: 2, duration: 15);

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

  void setTimesToShow(String newDur) {
    this.examSettings.secondsToShow = int.parse(newDur);
    notifyListeners();
  }

  List<int> getPossibleDurations() {
    return List.generate(
        6, (index) => this.examSettings.duration * (index + 1));
  }

  List<int> getPossibleTimesToShow() {
    return List.generate(
            10, (index) => this.examSettings.secondsToShow * (index + 1))
        .where((element) => element <= this.examSettings.duration)
        .toList();
  }
}
