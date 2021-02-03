import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemon_app/src/consts/globals.dart';
import 'package:telemon_app/src/consts/theme/colors.dart';
import 'package:telemon_app/src/consts/theme/theme.dart';
import 'package:telemon_app/src/ui/viewmodels/device_viewmodel.dart';

class DevicePage extends StatefulWidget {
  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  _DevicePageState();

  @override
  Widget build(BuildContext context) {
    final deviceViewModel = Provider.of<DeviceViewModel>(context);

    return Column(
      children: <Widget>[
        Text(l10n(context).devicePermissions),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 100),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            color: ThemeColors.theme.BLACK,
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(l10n(context).connectedDevice,
                      style: mainTheme()
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.white)),
                ),
                Text("${deviceViewModel.currDeviceMac}",
                    style: mainTheme()
                        .textTheme
                        .headline2
                        .copyWith(color: Colors.white)),
              ],
            )),
        Visibility(
            visible: deviceViewModel.currDeviceMac.isEmpty,
            child: FloatingActionButton(
              onPressed: () => {deviceViewModel.connectDevice()},
              child: Icon(Icons.add),
            )),
      ],
    );
  }
}
