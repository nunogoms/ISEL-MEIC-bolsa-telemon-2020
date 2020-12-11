import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telemon_app/config/app_config.dart';
import 'package:telemon_app/src/theme/definitions/colors.dart';
import 'package:telemon_app/src/widgets/appbars/back_title_appbar.dart';
import 'package:telemon_app/src/widgets/bottom_nav_bar.dart';
import 'package:telemon_app/src/widgets/buttons/measurements_button.dart';

class MeasurementsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackTitleAppbar("Medições").build(context),
      bottomNavigationBar: BottomNavBar(ModalRoute.of(context).settings.name),
      backgroundColor: ThemeColors.theme.SECONDARY_GREY,
      body: new Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),//TODO add theme.spacing
              child: Column(
              children : <Widget> [
                MeasurementsButton("Pesagem",ThemeColors.misc.MEASUREMENTS_SCALE,(){}),
                MeasurementsButton("Electrocardiograma",ThemeColors.misc.MEASUREMENTS_ECG,() {Navigator.pushNamed(context, Routes.ECG_PAGE);}),
                MeasurementsButton("Electromiograma",ThemeColors.misc.MEASUREMENTS_EMG,(){}),
                MeasurementsButton("Electroencefalograma",ThemeColors.misc.MEASUREMENTS_EEC,(){})
              ]
            ),
          ),

    );
  }
}
