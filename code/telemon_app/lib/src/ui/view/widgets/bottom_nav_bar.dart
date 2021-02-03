import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telemon_app/src/consts/globals.dart';
import 'package:telemon_app/src/consts/theme/colors.dart';

class BottomNavBar extends StatelessWidget {
  final int index;
  final Function(int) handleIndex;

  BottomNavBar({Key key, this.index, this.handleIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ThemeColors.theme.NAVBAR_BLUE,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment_outlined),
          label:  l10n(context).summary,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attribution_outlined),
          label: l10n(context).measurements,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.devices_outlined),
          label: l10n(context).device,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: l10n(context).settings,
        ),
      ],
      currentIndex: this.index,
      selectedItemColor: ThemeColors.theme.PRIMARY_WHITE,
      onTap: this.handleIndex,
    );
  }
}

