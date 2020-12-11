import 'package:bitalino/bitalino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telemon_app/src/services/bluetooth_service.dart';
import 'package:telemon_app/src/theme/definitions/colors.dart';
import 'package:telemon_app/src/theme/theme.dart';
import 'package:telemon_app/src/widgets/appbars/back_title_appbar.dart';

const String infoDevice =
    "Esta aplicação utiliza um dispositivo fornecido pelo seu médico." +
        " Este dispositivo conecta-se através de bluetooth, pelo que são pedidas permissões. Por favor aceite para continuar";

//TODO edit scaffold to be joined with another one
class EcgView extends StatefulWidget {
  @override
  _EcgViewState createState() => _EcgViewState();
}

class _EcgViewState extends State<EcgView> {
  //TODO passar strings p outro lado
  String currDevice = "";
  BITalinoController bitalinoController;
  bool measuring = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackTitleAppbar("ECG").build(context),
        backgroundColor: ThemeColors.theme.SECONDARY_GREY,
        body: new Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: ThemeColors.theme.PRIMARY_WHITE,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
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
                        bitalinoController =
                            await BluetoothService.connectToDevice();
                        setState(() {
                          currDevice = bitalinoController.address;
                          //TODO add error handling, nomeadamente dizer ao user que houve um erro
                        });
                      },
                      child: Icon(Icons.add),
                    )),
                Visibility(
                  visible: (currDevice.isEmpty) ? false : true,
                  child: FloatingActionButton(
                    onPressed: () async {
                      if (!measuring) {
                        await BluetoothService.startAcquisition(
                            bitalinoController);
                        setState(() {
                          measuring = true;
                        });
                      } else {
                        await BluetoothService.stopAcquisition(
                            bitalinoController);
                        setState(() {
                          measuring = false;
                        });
                      }
                    },
                    child: Icon(measuring ? Icons.stop : Icons.play_arrow),
                  ),
                ),
                Visibility(
                  visible: (!measuring && !currDevice.isEmpty) ? true : false,
                  child: RaisedButton(
                    onPressed: () async {
                      //TODO show this
                      BITalinoState state = await bitalinoController.state();
                      print("\n\n\n -------------------- DATA PRINT -------------------- \n\n\n");
                      print(state.analog); // [List<int>]
                      print(state.digital); // [List<int>]
                    },
                    child: Text("Print Stats"),
                  ),
                )
              ],
            )));
  }
}
