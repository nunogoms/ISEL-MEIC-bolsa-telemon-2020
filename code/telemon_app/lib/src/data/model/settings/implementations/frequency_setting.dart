import 'package:bitalino/bitalino.dart';
import 'package:telemon_app/src/data/model/settings/isetting.dart';

class FrequencySetting extends ISetting<Frequency>{
  @override
  Frequency currValue;

  FrequencySetting(this.currValue);

  @override
  List<Frequency> getPossibleValues() {
    return Frequency.values;
  }

  @override
  String getCurrValueAsString() {
    return currValue.toString();
  }
}