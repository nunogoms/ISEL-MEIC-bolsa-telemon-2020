class BluetoothConnectionException implements Exception{
  final String msg;

  BluetoothConnectionException(this.msg);

  @override
  String toString() => 'We could not connect to the bitalino bluetooth device due to:$msg';
}

class OperatingSystemUnsupportedException implements Exception{
  final String operatingSystem;

  OperatingSystemUnsupportedException(this.operatingSystem);

  @override
  String toString() => 'This app does not work on this operating system - $operatingSystem';
}

class ConnectionDroppedException implements Exception{
  @override
  String toString() => 'The BITalino device is now disconnected, please connect again to continue';
}