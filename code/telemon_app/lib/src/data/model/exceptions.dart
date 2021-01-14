class BluetoothConnectionException implements Exception{

  BluetoothConnectionException();

  @override
  String toString() => 'We could not connect to the bitalino bluetooth device';
}