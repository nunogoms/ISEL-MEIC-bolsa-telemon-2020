import 'package:bitalino/bitalino.dart';
import 'package:flutter/cupertino.dart';

class SettingsViewModel extends ChangeNotifier  {
  Frequency sampleFrequency = Frequency.HZ1000 ;
  int secondsToShow=2;
  int duration = 40;

  List<Frequency> getPossibleFrequencies()  {
    return [Frequency.HZ1,Frequency.HZ10,Frequency.HZ100,Frequency.HZ1000];
  }

  void setSampleFrequency (String frequency) {
    List<Frequency> frequencies = getPossibleFrequencies();
    Frequency newFreq = frequencies.firstWhere((element) => element.toString() ==frequency);
    this.sampleFrequency = newFreq;
    notifyListeners();
  }

  void setDuration (String newDur){
    duration = int.parse(newDur);
    if(duration<secondsToShow)secondsToShow = getPossibleTimesToShow().last;
    notifyListeners();
  }

  void setTimesToShow (String newDur){
    secondsToShow = int.parse(newDur);
    notifyListeners();
  }

  List<int> getPossibleDurations()  {
    return List.generate(6, (index) => index*20);
  }

  List<int> getPossibleTimesToShow()  {
    return List.generate(6, (index) => index*index+index).where((element) => element < this.duration).toList();
  }
}