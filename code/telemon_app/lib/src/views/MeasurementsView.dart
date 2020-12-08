import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telemon_app/src/theme/definitions/colors.dart';
import 'package:telemon_app/src/theme/theme.dart';
import 'package:telemon_app/src/widgets/appbars/back_title_appbar.dart';
import 'package:telemon_app/src/widgets/bottom_nav_bar.dart';

class MeasurementsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackTitleAppbar("Medições").build(context),
        bottomNavigationBar: BottomNavBar(ModalRoute.of(context).settings.name),
        backgroundColor: ThemeColors.theme.SECONDARY_GREY,
        body: new Container( //TODO passar isto para widget e fazr lista de children
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Center(
              child: FlatButton(
                  color: ThemeColors.theme.PRIMARY_WHITE,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  minWidth: double.infinity,
                  onPressed: () {},
                  child: Text(
                      "Pesagem",
                      textAlign: TextAlign.center,
                      style: mainTheme().textTheme.headline2.copyWith(
                        color: ThemeColors.misc.MEASUREMENTS_SCALE,
                      )
                  )
              ),
            ),
        ),
    );
  }
}