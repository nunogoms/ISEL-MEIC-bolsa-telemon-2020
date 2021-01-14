import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemon_app/src/theme/definitions/colors.dart';
import 'package:telemon_app/src/theme/theme.dart';
import 'package:telemon_app/src/ui/viewmodels/device_viewmodel.dart';

const String infoDevice =
    "Esta aplicação utiliza um dispositivo fornecido pelo seu médico." +
        " Este dispositivo conecta-se através de bluetooth, pelo que são pedidas permissões. Por favor aceite para continuar";

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
        Text(infoDevice),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 100),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            color: ThemeColors.theme.BLACK,
            child: Column(
              children: <Widget>[
                Center(
                  child: Text("Dispositivo conectado :",
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
