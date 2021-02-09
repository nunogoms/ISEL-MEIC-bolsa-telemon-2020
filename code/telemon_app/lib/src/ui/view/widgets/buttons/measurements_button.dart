import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telemon_app/src/general/theme/colors.dart';
import 'package:telemon_app/src/general/theme/theme.dart';


class MeasurementsButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function onPressed;

  MeasurementsButton(this.title, this.color, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
        child: SizedBox(
            width: double.infinity,
            child: RaisedButton(
                color: ThemeColors.theme.PRIMARY_WHITE,
                padding: EdgeInsets.symmetric(vertical: 5),
                elevation: 10,
                onPressed: () => this.onPressed(this.title),
                child: Text(this.title,
                    textAlign: TextAlign.center,
                    style: mainTheme().textTheme.headline2.copyWith(
                          color: this.color,
                        )
                )
            )
        )
    );
  }
}
