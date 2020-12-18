import 'package:bitalino/bitalino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telemon_app/src/model/device/device.dart';
import 'package:telemon_app/src/services/bluetooth_service.dart';
import 'package:telemon_app/src/theme/definitions/colors.dart';
import 'package:telemon_app/src/theme/theme.dart';

const String infoDevice =
    "Esta aplicação utiliza um dispositivo fornecido pelo seu médico." +
        " Este dispositivo conecta-se através de bluetooth, pelo que são pedidas permissões. Por favor aceite para continuar";

class DevicePage extends StatefulWidget {
  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  final bitalinoDevice = DeviceController();
  String currDevice =  "";

  @override
  Widget build(BuildContext context) {
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
                Text("$currDevice",
                    style: mainTheme()
                        .textTheme
                        .headline2
                        .copyWith(color: Colors.white)),
              ],
            )),
        Visibility(
            visible: (currDevice.isEmpty) ? true : false,
            child: FloatingActionButton(
              onPressed: () async {
                await bitalinoDevice.connect();
                setState(() {
                  currDevice = bitalinoDevice.getAddress();
                  //TODO add error handling, nomeadamente dizer ao user que houve um erro
                });
              },
              child: Icon(Icons.add),
            )),
      ],
    );
  }
}
