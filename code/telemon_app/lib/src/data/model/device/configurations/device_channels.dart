enum DeviceChannel { A1, A2, A3, A4, A5,A6, PWM, O1, O2 }

extension ChannelNumber on DeviceChannel {
  int get value {
    switch (this) {
      case DeviceChannel.A1:
        return 0;
      case DeviceChannel.A2:
        return 1;
      case DeviceChannel.A3:
        return 2;
      case DeviceChannel.A4:
        return 3;
      case DeviceChannel.A5:
        return 4;
      case DeviceChannel.A6:
        return 5;
      case DeviceChannel.PWM:
        return 6;
      case DeviceChannel.O1:
        return 7;
      case DeviceChannel.O2:
        return 8;
    }
    throw new Exception(
        "The value $this is not a valid sensor"); //TODO exception management and string
  }
}