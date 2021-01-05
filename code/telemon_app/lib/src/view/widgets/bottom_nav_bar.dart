import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telemon_app/config/app_config.dart';
import 'package:telemon_app/src/theme/definitions/colors.dart';
import 'package:telemon_app/src/theme/theme.dart';

class BottomNavBar extends StatelessWidget {
  final int index;
  final Function(int) handleIndex;

  BottomNavBar({Key key, this.index, this.handleIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ThemeColors.theme.NAVBAR_BLUE,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment_outlined),
          label: 'Resumo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attribution_outlined),
          label: 'Medições',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.devices_outlined),
          label: 'Dispositivo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: 'Definições',
        ),
      ],
      currentIndex: this.index,
      selectedItemColor: ThemeColors.theme.PRIMARY_WHITE,
      onTap: this.handleIndex,
    );
  }
}