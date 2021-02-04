import 'package:flutter/cupertino.dart';
import 'package:telemon_app/config/app_config.dart';
import 'package:telemon_app/src/consts/globals.dart';
import 'package:telemon_app/src/consts/theme/colors.dart';
import 'package:telemon_app/src/ui/view/views/measurements/generic_view.dart';
import 'package:telemon_app/src/ui/view/widgets/buttons/measurements_button.dart';

class MeasurementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //TODO add theme.spacing
      child: Column(children: <Widget>[
        MeasurementsButton(
            l10n(context).weightMeasurement, ThemeColors.misc.MEASUREMENTS_SCALE, (_) {Navigator.pushNamed(context, Routes.SCALE_PAGE);}
        ),
        MeasurementsButton(
            l10n(context).ecgMeasurement, ThemeColors.misc.MEASUREMENTS_ECG,
                (String title) {
              Navigator.pushNamed(context, Routes.ECG_PAGE,
                  arguments: GenericViewArgs(title));
            }),
        MeasurementsButton(l10n(context).emgMeasurement, ThemeColors.misc.MEASUREMENTS_EMG,
                (String title) {
              Navigator.pushNamed(context, Routes.EMG_PAGE,
                  arguments: GenericViewArgs(title));
            }),
        /*MeasurementsButton(
            "Electroencefalograma", ThemeColors.misc.MEASUREMENTS_EEC,
                (String title) {
              Navigator.pushNamed(context, Routes.EEG_PAGE,
                  arguments: GenericViewArgs(title));
              }),*/
        MeasurementsButton(
            l10n(context).edaMeasurement, ThemeColors.misc.MEASUREMENTS_EDG,
                (String title) {
              Navigator.pushNamed(context, Routes.EDA_PAGE,
                  arguments: GenericViewArgs(title));
            }),
        MeasurementsButton(
              l10n(context).accMeasurement, ThemeColors.misc.MEASUREMENTS_EEC,
                (String title) {
              Navigator.pushNamed(context, Routes.ACC_PAGE,
                  arguments: GenericViewArgs(title));
            }),
      ]),
    );
  }
}
