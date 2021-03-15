import 'package:telemon_app/src/data/model/device/configurations/idevice.dart';
import 'package:telemon_app/src/data/model/settings/isetting.dart';

class DeviceConfigurationSetting extends ISetting<DeviceImplementations> {
  @override
  DeviceImplementations currValue;
  late IDevice currDeviceConfiguration;

  DeviceConfigurationSetting(this.currValue){
    currDeviceConfiguration = this.currValue.value;
  }

  @override
  List<DeviceImplementations> getPossibleValues() {
    return DeviceImplementations.values;
  }

  @override
  void setNewValue(String t) {
    super.setNewValue(t);
    currDeviceConfiguration = currValue.value;
  }
}