import 'package:flutter/cupertino.dart';
import 'package:telemon_app/config/app_config.dart';
import 'package:telemon_app/src/theme/definitions/colors.dart';
import 'package:telemon_app/src/ui/view/widgets/buttons/measurements_button.dart';

class MeasurementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //TODO add theme.spacing
      //TODO levar o que aparece para uma juncao com o disp. - last thing to do
      child: Column(children: <Widget>[
        MeasurementsButton(
            "Pesagem", ThemeColors.misc.MEASUREMENTS_SCALE, () {}),
        MeasurementsButton(
            "Electrocardiograma", ThemeColors.misc.MEASUREMENTS_ECG,
                () {Navigator.pushNamed(context, Routes.ECG_PAGE);}),
        MeasurementsButton("Electromiograma", ThemeColors.misc.MEASUREMENTS_EMG,
            () {Navigator.pushNamed(context, Routes.EMG_PAGE); }),
        /*MeasurementsButton(
            "Electroencefalograma", ThemeColors.misc.MEASUREMENTS_EEC,
           () {Navigator.pushNamed(context, Routes.EEG_PAGE);}),*/
        MeasurementsButton(
            "Análise Electrodérmica", ThemeColors.misc.MEASUREMENTS_EDG,
                () {Navigator.pushNamed(context, Routes.EDA_PAGE);}),
        MeasurementsButton(
            "Análise de Aceleração", ThemeColors.misc.MEASUREMENTS_EEC,
                () {Navigator.pushNamed(context, Routes.ACC_PAGE);}),
      ]),
    );
  }
}
