
import 'package:bitalino/bitalino.dart';
class Units {
  static int convertToMillis (Frequency frequency){
    return 1000 ~/ serializeFrequency(frequency);
  }
}
