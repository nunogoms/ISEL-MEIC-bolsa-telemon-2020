import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telemon_app/config/app_config.dart';
import 'package:telemon_app/src/theme/definitions/colors.dart';
import 'package:telemon_app/src/theme/theme.dart';

const List<String> paths = [
  Routes.HIGHLIGHTS,
  Routes.MEASUREMENTS_PAGE,
  Routes.DEVICE_PAGE,
  Routes.SETTINGS,
];

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;

  BottomNavBar(String path) : this.selectedIndex = paths.indexOf(path);

  void _onItemTapped(BuildContext context, int index) {
    if (this.selectedIndex != index) {
      Navigator.pushNamed(context, paths[index]);
    }//TODO stop animation
  }

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
          icon: Icon(Icons.devices),
          label: 'Dispositivo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: 'Definições',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: ThemeColors.theme.PRIMARY_WHITE,
      onTap: (index) {
        _onItemTapped(context, index);
      },
    );
  }
}
