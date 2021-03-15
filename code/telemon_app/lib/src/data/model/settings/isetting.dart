abstract class ISetting <T> {
  abstract T currValue;

  /// Any needed comparisons should be done here, for instance verifying that the new
  /// value is not null
  void setNewValue(String t){
    T newFreq = getPossibleValues().firstWhere((element) => element.toString() == t);
    if(newFreq == null)throw Exception("Error retrieving Frequency");
    currValue = newFreq;
  }

  /// Values that will be presented for the user to chose from. Used as a easy to
  /// avoid injection as well as avoiding value sanitation
  List<T> getPossibleValues();
}
//TODO fazer classes p isto